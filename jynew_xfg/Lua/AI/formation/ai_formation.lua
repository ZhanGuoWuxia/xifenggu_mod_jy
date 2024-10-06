--是否为肉盾
---@param role RoleInstance 角色实例
function is_tank(role)
    return role.RoleClass == "铁卫"
end

--是否为dps
---@param role RoleInstance 角色实例
function is_dps(role)
    return not is_tank(role) and not is_support(role)
end

--是否为辅助
---@param role RoleInstance 角色实例
function is_support(role)
    return role.RoleClass == "医师"
end

local function get_menpai_battle_roles(menpai)
    local res = {}
    local allMenpaiRoles = roles_of_menpai(menpai)
    for i, role in pairs(allMenpaiRoles) do
        if role:CanJoinBattle() then
            res[#res + 1] = role
        end
    end
    return res
end

local function create_formation_item(pos, role, team)
    return {
        Pos = pos,
        Role = role,
        Team = team
    }
end

local function remove_role(roles, roleToSelect)
    for i = #roles, 1, -1 do
        if roles[i] == roleToSelect then
            table.remove(roles, i)
        end
    end
end

local function pick_roles(roles, predicate, pickNum)
    local res = table.where(roles, predicate)
    local len = math.min(pickNum, #roles)
    for i = 1, len do
        local selectRole = roles[i]
        remove_role(roles, selectRole)
        res[#res + 1] = selectRole
    end
    return res
end

local function pick_tank(roles, pickNum)
    return pick_roles(roles, is_tank, pickNum)
end

local function pick_dps(roles, pickNum)
    return pick_roles(roles, is_dps, pickNum)
end

local function pick_support(roles, pickNum)
    return pick_roles(roles, is_support, pickNum)
end

local function remove_formation_pos(arr, pos)
    for i = #arr, 1, -1 do
        if arr[i] == pos then
            table.remove(arr, i)
        end
    end
end


--ai阵型策略
--默认标准随机阵容 至少三人
--1肉 2,3,4为dps 5为辅助
--等级高的优先 没有合适的人就随便找个补位
local function ai_std_formation(menpai, team, MaxRoleNum)
    local battle_roles = get_menpai_battle_roles(menpai)
    return ai_std_formation_roles(battle_roles, team, MaxRoleNum)
end

function ai_std_formation_roles(availableRoles, team, MaxRoleNum)
    local pickIdx = 1
    local pickedRoles = {}
    local formation = {}
    local MaxRoleNum = MaxRoleNum and math.clamp(MaxRoleNum, 3, 5) or 5

    if #availableRoles <= 0 then
        print("一个上阵的都没有")
        return formation
    end

    --肉
    pickedRoles[pickIdx] = pick_tank(availableRoles, 1)[1]
    pickIdx = pickIdx + 1

    --3dps
    local dpsNum = math.max(1, MaxRoleNum - 3)
    local dpsRoles = pick_dps(availableRoles, dpsNum)
    for i = 1, #dpsRoles do
        pickedRoles[pickIdx] = dpsRoles[i]
        pickIdx = pickIdx + 1
    end
    --辅助
    pickedRoles[pickIdx] = pick_support(availableRoles, 1)[1]

    --补位
    for i = 1, MaxRoleNum do
        if not pickedRoles[i] and #availableRoles > 0 then
            pickedRoles[i] = table.pick_random(availableRoles)
            remove_role(availableRoles, pickedRoles[i])
        end
    end

    local all_positions = TeamPos:all_positions()
    --肉站第一行
    local tankRow = math.random(0 , MAX_TEAM_ROW - 1)
    local tankPos = row_col_2_pos(tankRow, 0)
    remove_formation_pos(all_positions, tankPos)

    if pickedRoles[1] then
        table.insert(formation, create_formation_item(tankPos, pickedRoles[1], team))
    end

    --辅助站Tank那一行最后

    local supportPos = row_col_2_pos(tankRow, MAX_TEAM_COL - 1)
    remove_formation_pos(all_positions, supportPos)
    if pickedRoles[pickIdx] then
        table.insert(formation, create_formation_item(supportPos, pickedRoles[5], team))
    end

    --dps随便站
    local dpsPositions = table.pick_random_many(all_positions, dpsNum)
    for i = 2, dpsNum do
        if pickedRoles[i] then
            table.insert(formation, create_formation_item(dpsPositions[i - 1], pickedRoles[i], team))
        end
    end

    return formation
end

local formation_strategies =
{
    [1] = ai_std_formation,
}

--避免有些时候忘了设置队伍
local function ensure_team_correct(formation, team)
    if formation then
        for _, pos in pairs(formation) do
            pos.Team = team
        end
    end
end

function get_menpai_preset_formation(menpai, team)
    --盟友助阵
    local formation = {}
    local allied_menpais = get_allied_menpais(menpai)
    if allied_menpais.Count <= 0 then
        return
    end
    if not has_flag("盟友索引") then
        return
    end
    local allied_menpai = allied_menpais[get_flag_int("盟友索引")]
    --概率
    local diplomatic = require("Common/diplomatic")
    local evaluation = diplomatic.evaluate(menpai, allied_menpai)
    local baseAddition = current_difficult_param(DIFFICULT_PARAM_KEY.StrategyAddition)
    local friendship = diplomatic.get_friendship(menpai, allied_menpai)

    local isOk = chance((evaluation / MaxRoleLevel + friendship / 150 + baseAddition) * 100)
    if isOk then
        pop_tip(string.i18_format("盟友<color=#ff7a00>{0}</color>前来助阵", allied_menpai.Name))
        local faction_control = require("Common/faction")
        local pickNum = math.random(1, 3)
        local roles = faction_control.pick_random_template_roles(allied_menpai, 1, pickNum)
        if #roles == 0 then
            table.insert(roles, create_temp_role("随机侠士", 5))
        end
        formation = ai_std_formation_roles(roles)
    else
        pop_tip(string.i18_format("盟友<color=#ff7a00>{0}</color>拒绝援助", allied_menpai.Name))
        change_both_friendship(menpai, allied_menpai, -20)
    end
    ensure_team_correct(formation, team)
    remove_flag("盟友索引")
    return formation
end

local function remove_random_many(formation, removeNum)
    local res = table.duplicate(formation)
    if #formation <= removeNum then
        return {}
    end
    for i = 1, removeNum do
        local idx = math.random(1, #res)
        local remove_item = table.remove(res, idx)
        if remove_item and remove_item.Role then
            pop_tip(string.i18_format("<color=#ff7a00>{0}</color>受到禁战，已移除阵容！", remove_item.Role.Name))
        end
    end
    return res
end

function get_menpai_ai_formation(menpai, team)
    local formation = {}
    local ai = aiManager:getAI(menpai.AIName)
    --先看ai给阵型不
    if ai then
        formation = ai:getformations(menpai, team)
    end
    --ai没有就从默认策略里随机选一个
    if not formation then
        local strategy = table.pick_random(formation_strategies)
        formation = strategy(menpai, team)
    end
    --阵型按减少人数随机移除
    local faction_control = require("Common/faction")
    if faction_control.has_menpai_flag(menpai, "阵容上限减少人数") then
        local num = faction_control.get_menpai_flag_int(menpai, "阵容上限减少人数")
        formation = remove_random_many(formation, num)
        faction_control.remove_menpai_flag(menpai, "阵容上限减少人数")
    end
    ensure_team_correct(formation, team)
    return formation
end

return formation_strategies
