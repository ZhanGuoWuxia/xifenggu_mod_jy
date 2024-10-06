local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType
local ActionHitType = CS.ZhanGuoWuxia.Backend.Battle.Data.ActionHitType
local ResistDebuffType = CS.ZhanGuoWuxia.Backend.Battle.Data.DebuffResistType
local BattleFieldClass = CS.ZhanGuoWuxia.Backend.Battle.BattleField
local CritType  = CS.ZhanGuoWuxia.Backend.Battle.Data.CriticalRet
local StealMoney = game_api.StealMoneyInBattle

local function compare(v1, symbol, v2)
    local ret = false
    if symbol == "==" then ret = v1 == v2
    elseif symbol == "!=" then ret = v1 ~= v2
    elseif symbol == "<" then ret = v1 < v2
    elseif symbol == ">" then ret = v1 > v2
    elseif symbol == "<=" then ret = v1 <= v2
    elseif symbol == ">=" then ret = v1 >= v2
    end
    return ret
end

function current_battle()
    return BattleFieldClass.CurrentBattle
end

function is_role_of_beanId(roleId, beanId)
    local role = get_battle_role(roleId)
    if not role then
        return false
    end
    return role.BindRole.BeanId == beanId
end

function is_role_in_team(beanId, team)
    local res = get_roles_of_team(team,
    function(role)
        return is_role_of_beanId(role.InstanceId, beanId) and role:IsAlived()
    end)
    return #res > 0
end
    

--获取某个角色 抵抗目标伤害类型 的防御属性
function get_dmg_def_attr(defender, dmgType)
    local stat = 0
    if not defender then
        return 0
    end
    if dmgType == DamageType.Physical then
        stat = role_stat(defender.InstanceId, stat_key.Defense)
    end
    return stat
end

--获取某个角色 对目标造成伤害类型 的攻击属性
function get_attacker_dmg_atk_attr(attacker, dmgType)
    local stat = 0
    if not attacker then
        return 0
    end
    if dmgType == DamageType.Physical then
        stat = role_stat(attacker.InstanceId, stat_key.Attack)
    elseif dmgType == DamageType.Magical then
        stat = role_stat(attacker.InstanceId, stat_key.InnerStrength)
    end
    return stat
end

--判定两个角色是否是同一队的
function is_same_team(roleId1, roleId2)
    local role1 = get_battle_role(roleId1)
    local role2 = get_battle_role(roleId2)
    if role1 and role2 then
        return role1.Team == role2.Team
    end
    return false
end

--判断一个战斗中的角色是否存活
function is_alive(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return true
    end
    return role:IsAlived()
end

--判定一个战斗中的角色是否死亡
function is_dead(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return true
    end
    return role:IsDead()
end

--根据位置获取角色实例
function roleid_at_pos(pos, team)
    local battleField = current_battle()
    if battleField == nil then
        return -1
    end
    local role = battleField:GetRoleAtTeamPos(pos, team)
    if not role then
        return -1
    end
    return role.InstanceId
end

--获取角色前方的存活角色
function alive_role_of_front(roleId)
    if roleId == nil or roleId < 0 then
        return -1
    end
    local col = col_of_role(roleId)
    local row = row_of_role(roleId)
    col = col - 1
    if col < 0 then
        return -1
    end
    local targetRoleId = roleid_at_row_col(row, col, team_of_role(roleId))
    if is_dead(targetRoleId) then
        return -1
    end
    return targetRoleId
end

--获取角色后方的存活角色
function alive_role_of_back(roleId)
    if roleId == nil or roleId < 0 then
        return -1
    end
    local col = col_of_role(roleId)
    local row = row_of_role(roleId)
    col = col + 1
    if col >= MAX_TEAM_COL then
        return -1
    end
    local targetRoleId = roleid_at_row_col(row, col, team_of_role(roleId))
    if is_dead(targetRoleId) then
        return -1
    end
    return targetRoleId
end

--获取角色下方的存活角色
function alive_role_of_down(roleId)
    if roleId == nil or roleId < 0 then
        return -1
    end
    local col = col_of_role(roleId)
    local row = row_of_role(roleId)
    if row == 2 then
        return -1
    end
    col = col + 3
    local targetRoleId = roleid_at_row_col(row, col, team_of_role(roleId))
    if is_dead(targetRoleId) then
        return -1
    end
    return targetRoleId
end

--获取角色上方的存活角色
function alive_role_of_up(roleId)
    if roleId == nil or roleId < 0 then
        return -1
    end
    local col = col_of_role(roleId)
    local row = row_of_role(roleId)
    if row == 0 then
        return -1
    end
    col = col - 3
    local targetRoleId = roleid_at_row_col(row, col, team_of_role(roleId))
    if is_dead(targetRoleId) then
        return -1
    end
    return targetRoleId
end

--角色在哪一列 0代表第1列 1代表第2列 2代表第3列
function col_of_role(roleid)
    return col_of_pos(pos_of_role(roleid))
end

--角色在哪一行 0代表第1行 1代表第2行 2代表第3行
function row_of_role(roleid)
    return row_of_pos(pos_of_role(roleid))
end

--位置编号在哪一列 0代表第1列 1代表第2列 2代表第3列
function col_of_pos(pos)
    local _, col = pos_2_row_col(pos)
    return col
end

--位置编号在哪一行 0代表第1行 1代表第2行 2代表第3行
function row_of_pos(pos)
    local row, _ = pos_2_row_col(pos)
    return row
end

--获取某一队 第row行 第col列的角色
function roleid_at_row_col(row, col, team)
    local battleField = current_battle()
    if battleField == nil then
        return -1
    end
    local role = battleField:GetRoleAtTeamPos(row, col, team)
    if not role then
        return -1
    end
    return role.InstanceId
end

--获取角色的位置编号
function pos_of_role(roleId)
    local role = get_battle_role(roleId)
    if role then
        return role.Pos
    end
    return -1
end

--获取角色的队伍
function team_of_role(roleId)
    local role = get_battle_role(roleId)
    if role then
        return role.Team
    end
    return -1
end

--获取玩家的队伍
function team_of_player()
    local battleField = current_battle()
    if battleField == nil then
        print("battleField" .. tostring(battleField))
        return -1
    end
    return battleField.PlayerTeam
end

--获取角色 敌方的队伍
function enemy_team_of_role(roleId)
    local role = get_battle_role(roleId)
    if role then
        return math.abs(role.Team - 1)
    end
    return -1
end

function str_to_battlerole_id_in_team(strId, team)
    local battleField = current_battle()
    if not battleField then
        return -1
    end
    local role = battleField:GetRoleByBeanId(strId)
    if not role then
        return -1
    end
    if role.Team ~= team then
        return -1
    end
    if role:IsDead() then
        return -1
    end
    return role.InstanceId
end

function str_to_battlerole_id(strId)
    local battleField = current_battle()
    if not battleField then
        return -1
    end
    local role = battleField:GetRoleByBeanId(strId)
    if not role then
        return -1
    end
    return role.InstanceId
end

function get_battle_role(roleId)
    local battleField = current_battle()
    if battleField == nil then
        print("battleField" .. tostring(battleField))
        return
    end
    return battleField:GetRoleById(roleId)
end

--获取一个战斗角色的战斗数据状态
---@param roleId int BattleRoleInstance对应的instanceId
---@param statName string 数据key
function role_stat(roleId, statName)
    local role = get_battle_role(roleId)
    if not role then
        return 0
    end
    --最大生命值要特殊处理下，获取的是受伤状态下的最大生命值
    if statName == stat_key.MaxHp then
        return role.ActualMaxHp
    end
    return role:GetStat(statName)
end

--设置一个战斗角色的当前生命值
function set_role_cur_hp(roleId, hp)
    local role = get_battle_role(roleId)
    if not role then
        return
    end
    role.Hp = hp
end

--获取目标角色的当前生命百分比 (0 - 1之间)
function role_hp_percent(roleId)
    local battleRole = get_battle_role(roleId)
    if not battleRole then
        return 0
    end
    return battleRole.HpPercent
end

--获取目标角色已损失的生命百分比(0 - 1之间)
function role_losed_hp_percent(roleId)
    return 1 - role_hp_percent(roleId)
end

--将一个战斗角色的当前生命值与目标值进行比较
function role_hp_check(roleId, symbol, value)
    return compare(role_stat(roleId, stat_key.CurrentHp), symbol, value)
end

--将一个战斗角色的当前生命值百分比与目标值进行比较
function role_hp_percent_check(roleId, symbol, value)
    return compare(role_hp_percent(roleId), symbol, value)
end

--将一个战斗角色的当前内力与目标值进行比较
function role_mp_check(roleId, symbol, value)
    return compare(role_stat(roleId, stat_key.CurrentMp), symbol, value)
end

--将一个战斗角色的攻击力与目标值进行比较
function role_attack_check(roleId, symbol, value)
    return compare(role_stat(roleId, stat_key.Attack), symbol, value)
end

--将一个战斗角色的防御与目标值进行比较
function role_defense_check(roleId, symbol, value)
    return compare(role_stat(roleId, stat_key.Defense), symbol, value)
end

--将一个战斗角色的暴击值与目标值进行比较
function role_crit_check(roleId, symbol, value)
    return compare(role_stat(roleId, stat_key.Crit), symbol, value)
end

--将一个战斗角色的速度与目标值进行比较
function role_speed_check(roleId, symbol, value)
    return compare(role_stat(roleId, stat_key.Speed), symbol, value)
end

--将一个战斗角色的护盾与目标值进行比较
function role_shield_check(roleId, symbol, value)
    return compare(role_stat(roleId,  stat_key.Shield), symbol, value)
end

--增加角色护盾值
function role_add_shield(roleId, addNum)
    local role = get_battle_role(roleId)
    if not role then
        return
    end
    local plusShield = math.floor(addNum)
    print(role.Name .. "护盾增加了:" .. plusShield)
    role.Shield = role.Shield + plusShield
end

--交换两个角色的位置，仅对在同一边的单位生效
function swap_role_pos(roleId1, roleId2)
    local battleField = current_battle()
    if battleField then
        battleField:SwapPosition(roleId1, roleId2)
    end
end

function swap_or_change_role_pos(roleId, pos)
    local battleField = current_battle()
    if not battleField then
        return
    end
    if pos < 0 or pos >= MAX_TEAM_COL * MAX_TEAM_ROW then
        return
    end
    local team = team_of_role(roleId)
    local targetRoleId = roleid_at_pos(pos, team)
    if targetRoleId == roleId then
        return
    end

    if targetRoleId == -1 then
        change_role_pos(roleId, pos)
    else
        swap_role_pos(roleId, targetRoleId)
    end
end

--更改角色的位置
function change_role_pos(roleId, pos)
    local battleField = current_battle()
    if battleField  then
        if roleid_at_pos(pos, team_of_role(roleId)) == -1 then
            battleField:ChangePosition(get_battle_role(roleId), pos)
        else
            print("指定位置已存在角色，无法更改")
        end
    end
end

--进行一次攻击命中判定
function check_hit(hit_param)

    local attackerId = hit_param.AttackerId
    local defenderId = hit_param.DefenderId

    --被闪避
    local antiDodgeValue = role_stat(attackerId, stat_key.AntiDodge) + hit_param.AntiDodgeAddition
    local dodgeValue = role_stat(defenderId, stat_key.Dodge) + hit_param.DodgeAddition
    local hit_rate = cal_hit_rate(antiDodgeValue, dodgeValue * hit_param.DodgeScale)
    if not chance(hit_rate) then
        return ActionHitType.Dodge
    end

    --被格挡
    local parry = role_stat(defenderId, stat_key.Parry) + hit_param.ParryAddition
    local antiparry = role_stat(attackerId, stat_key.AntiParry) + hit_param.AntiParryAddition
    local parryProbability = cal_parry_rate(parry * hit_param.ParryScale, antiparry)
    if chance(parryProbability) then
        return ActionHitType.Parry
    end

    return ActionHitType.Hit
end

function check_resist_debuff(ResistParam)

    local attackerId = ResistParam.AttackerId
    local defenderId = ResistParam.DefenderId

    local tenacity = role_stat(defenderId, stat_key.Tenacity) + ResistParam.ResistAddition
    tenacity = ResistParam.ResistScale * tenacity
    local resistRate = cal_resist_debuff_rate(tenacity)
    
    if chance(resistRate) then
        return ResistDebuffType.Resisted
    end
    return ResistDebuffType.None
end

--进行一次暴击判定
function check_critical(CritParam)
    local critLevel = role_stat(CritParam.AttackerId, stat_key.Crit) + CritParam.CritAddition
    local critRate = crit_rate(critLevel)
    local isCrit = chance(critRate * CritParam.CritScale)
    --友方计算不考虑暴击抗性
    if CritParam.IsFriendly then
        if isCrit then
            return CritType.Crit
        else
            return CritType.NotCrit
        end
    else
        if isCrit then
            -- local criDefenseLevel = role_stat(CritParam.DefenderId, stat_key.CritDefense)
            -- local defendRate = crit_defense_rate(critLevel, criDefenseLevel + CritParam.CritDefAddition)
            -- if chance(defendRate) then
            --     return CritType.CritButResist
            -- else
                return CritType.Crit
            -- end
        end
    end
    return CritType.NotCrit
end

function alive_roles_around_role(roleId)
    local res = {}
    local row = row_of_role(roleId)
    local col = col_of_role(roleId)
    local team = team_of_role(roleId)
    --周围九格判断下
    for i = -1, 1 do
        for j = -1, 1 do
            local row = row + i
            local col = col + j
            local targetRoleId = roleid_at_row_col(row, col, team)
            if targetRoleId ~= -1 and not is_dead(targetRoleId) then
                table.insert(res, targetRoleId)
            end
        end
    end
    return res
end

function get_alive_enemies_of_role(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return
    end
    local enemyTeam = math.abs(role.Team - 1)
    return get_team_alive_roles(enemyTeam)
end

function get_dead_enemies_of_role(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return
    end
    local enemyTeam = math.abs(role.Team - 1)
    return get_team_dead_roles(enemyTeam)
end

local function default_predicate(role)
    return true
end

function get_roles_of_team(team, predicate)
    predicate = predicate or default_predicate
    local res = {}
    local battleField = current_battle()
    if battleField then
        for _, role in pairs(battleField.Roles) do
            if role.Team == team and predicate(role) then
                res[#res + 1] = role.InstanceId
            end
        end
    end
    return res
end

function get_alive_roles_of_row(row, team)
    local res = {}
    local battleField = current_battle()
    if battleField then
        for col = 0, MAX_TEAM_COL - 1 do
            local roleId = roleid_at_row_col(row, col, team)
            if roleId ~= -1 and not is_dead(roleId) then
                table.insert(res, roleId)
            end
        end
    end
    return res
end

function get_alive_roles_of_col(col, team)
    local res = {}
    local battleField = current_battle()
    if battleField then
        for row = 0, MAX_TEAM_ROW - 1 do
            local roleId = roleid_at_row_col(row, col, team)
            if roleId ~= -1 and not is_dead(roleId) then
                table.insert(res, roleId)
            end
        end
    end
    return res
end

--获取同一列的其他角色
function get_other_roles_in_same_col(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return {}
    end
    local col = col_of_role(roleId)
    local team = team_of_role(roleId)
    local allRolesInCol = get_alive_roles_of_col(col, team)
    local otherRoles = {}
    for _, otherRoleId in ipairs(allRolesInCol) do
        if otherRoleId ~= roleId then
            table.insert(otherRoles, otherRoleId)
        end
    end
    return otherRoles
end

--获取同一行的其他角色
function get_other_roles_in_same_row(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return {}
    end
    local row = row_of_role(roleId)
    local team = team_of_role(roleId)
    local allRolesInRow = get_alive_roles_of_row(row, team)
    local otherRoles = {}
    for _, otherRoleId in ipairs(allRolesInRow) do
        if otherRoleId ~= roleId then
            table.insert(otherRoles, otherRoleId)
        end
    end
    return otherRoles
end

--获取同一列的全部角色
function get_roles_in_same_col(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return {}
    end
    local col = col_of_role(roleId)
    local team = team_of_role(roleId)
    local allRolesInCol = get_alive_roles_of_col(col, team)
    local otherRoles = {}
    for _, otherRoleId in ipairs(allRolesInCol) do
        table.insert(otherRoles, otherRoleId)
    end
    return otherRoles
end

--获取同一行的全部角色
function get_roles_in_same_row(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return {}
    end
    local row = row_of_role(roleId)
    local team = team_of_role(roleId)
    local allRolesInRow = get_alive_roles_of_row(row, team)
    local otherRoles = {}
    for _, otherRoleId in ipairs(allRolesInRow) do
        table.insert(otherRoles, otherRoleId)
    end
    return otherRoles
end

--指定一列(0-2)随机选取空余位置，如果有的话
function get_empty_pos_col(col, team)
    local pos = -1

    for i = 0, 2 do
        pos = col + i * 3
        if roleid_at_pos(pos, team) == -1 then
            return pos
        end
    end
    return -1
end

--指定一行(0-2)随机选取空余位置，如果有的话
function get_empty_pos_row(row, team)
    local pos = -1

    for i = 0, 2 do
        pos = row * 3 + i
        if roleid_at_pos(pos, team) == -1 then
            return pos
        end
    end
    return -1
end

--获取队伍所有空余位置
function get_all_empty_pos(team)
    local posTable = {}
    for pos = 0, 8 do
        if roleid_at_pos(pos, team) == -1 then
            table.insert(posTable, pos)
        end
    end
    return posTable
end

function get_roles_of_all_teams(predicate)
    predicate = predicate or default_predicate
    local res = {}
    local battleField = current_battle()
    if battleField then
        for _, role in pairs(battleField.Roles) do
            if predicate(role) then
                res[#res + 1] = role.InstanceId
            end
        end
    end
    return res
end

--获取某个角色的所有存活队友
function get_alive_teammates(battleRoleId)
    local team = team_of_role(battleRoleId)
    local allies = get_roles_of_team(team,
    function(role) 
        return role:IsAlived() and role.InstanceId ~= battleRoleId
    end)
    return allies
end

--获取指定队伍 存活 角色列表
function get_team_alive_roles(team)
    return get_roles_of_team(team,
    function(role)
        return role:IsAlived()
    end)
end

--获取所有队伍 存活 角色列表
function get_all_teams_alive_roles()
    return get_roles_of_all_teams(
        function(role)
        return role:IsAlived()
    end)
end

--获取指定队伍 受伤 角色列表
function get_team_hurt_roles(team)
    return get_roles_of_team(team,
    function(role)
        return role:IsAlived() and role:IsHurt()
    end)
end

--获取所有队伍 受伤 角色列表
function get_all_teams_hurt_roles()
    return get_roles_of_all_teams(
        function(role)
        return role:IsAlived() and role:IsHurt()
    end)
end

--获取指定队伍 死亡 角色列表
function get_team_dead_roles(team)
    return get_roles_of_team(team,
    function(role)
        return role:IsDead()
    end)
end

--获取所有队伍 死亡 角色列表
function get_all_teams_dead_roles()
    return get_roles_of_all_teams(
        function(role)
        return role:IsDead()
    end)
end

function pos_2_row_col(pos)
    if pos < 0 or pos >= MAX_TEAM_COL * MAX_TEAM_ROW then
        return -1, -1
    end
    local row = pos // MAX_TEAM_COL
    local col = math.fmod(pos ,MAX_TEAM_COL)
    return row, col
end

function row_col_2_pos(row, col)
    return row * MAX_TEAM_COL + col
end


--获取指定队伍当前生命值最低的角色ID
function get_team_lowest_hp_role(team)
    --获取指定队伍存活角色列表
    local roles = get_team_alive_roles(team)

    local lowestHpRoleId = nil
    --初始化一个极大值，用于比较
    local lowestHp = math.huge

    for _, roleId in ipairs(roles) do
        local currentHp = role_stat(roleId, stat_key.CurrentHp)  -- 获取敌人的当前生命值
        if currentHp < lowestHp then
            lowestHp = currentHp
            lowestHpRoleId = roleId
        end
    end

    return lowestHpRoleId
end

--获取指定队伍生命值百分比最低的角色ID
function get_team_lowest_hp_per_role(team)
    --获取指定队伍存活角色列表
    local roles = get_team_alive_roles(team)

    local lowestHpRoleId = nil
    --初始化一个极大值，用于比较
    local lowestPercent = math.huge

    for _, roleId in ipairs(roles) do
        local curPercent = role_hp_percent(roleId)
        if curPercent < lowestPercent then
            lowestPercent = curPercent
            lowestHpRoleId = roleId
        end
    end

    return lowestHpRoleId
end

--获取指定队伍的随机角色ID
function get_team_random_role(team)
    --获取指定队伍存活角色列表
    local roles = get_team_alive_roles(team)
    if #roles == 0 then
        return -1 -- No alive roles in the team
    end
    local index = math.random(#roles)
    return roles[index]
end

--获取指定队伍的随机角色ID且排除指定ID
function get_team_random_role_excluding(team, excludeRoleId)
    local roles = get_team_alive_roles(team)
    -- Filter out the excluded role ID
    local filteredRoles = {}
    for _, roleId in ipairs(roles) do
        if roleId ~= excludeRoleId then
            table.insert(filteredRoles, roleId)
        end
    end
    if #filteredRoles == 0 then
        return -1 -- No eligible roles after exclusion
    end
    local index = math.random(#filteredRoles)
    return filteredRoles[index]
end

--让一个角色从另一个角色那里偷取金钱
function battle_role_steal_money(thiefRoleId, moneyNum, fromRoleId)
    assert(moneyNum > 0, "money must be large than 0")
    fromRoleId = fromRoleId or -1
    StealMoney(thiefRoleId, fromRoleId, moneyNum)
end


--判断角色是否为男性
function is_role_male(roleId)
    local role = get_battle_role(roleId)
    return role and role.BindRole.IsMale or false
end

--判断角色是否为女性
function is_role_female(roleId)
    return not is_role_male(roleId)
end

--获取角色表里的ID
function is_role_person(roleId, roleConfigId)
    local role = get_battle_role(roleId)
    if not role then
        return false
    end
    return role.BindRole.BeanId == roleConfigId
end

--获取角色的职业id
function get_role_classId(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return -1
    end
    return role.BindRole.ClassId
end

function suicide_battle_role(roleId)
    local role = get_battle_role(roleId)
    if not role then
        return
    end
    role:Suicide()
end


--summon_battle_role("测试木桩", math.random(0, 8), math.random(0, 1), ownerId)

function summon_battle_role(roleId, pos, team, summonerId, is_from_save)
    local battleField = current_battle()
    if battleField == nil then
        return -1
    end

    --是否召唤存档中的角色对象
    if is_from_save == nil then
        is_from_save = false
    end
    summonerId = summonerId or -1

    local summonData = 
    {
        PerformRoleId = summonerId,
        Pos = pos,
        Team = team,
        roleId = roleId,
        IsFromSave = is_from_save,
    }

    return battleField:SummonRole(summonData)
end