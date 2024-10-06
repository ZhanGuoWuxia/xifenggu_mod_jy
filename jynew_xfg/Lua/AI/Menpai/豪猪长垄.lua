local ai_decision = require("AI/decisions")
local ai = class("豪猪长垄AI", require('AI/template/ai_base'))

local function get_girls(menpai)
    local all_roles = table.cslist_2_table(roles_of_menpai(menpai))
    return table.where(all_roles, function(r) return r.BeanId == "被玩坏的女子" end)
end

--发呆算分
local function daze_score(menpai)
    return math.random(1, 5)
end

local function cure_score(menpai)
    local woundRoles = table.where(roles_of_menpai(menpai), function(r) return r.IsWound end)
    local cnt = #woundRoles
    if cnt <= 0 then
        return -999
    end
    return math.random(2, 6)
end

--动态调整算分
local function adjust_score()
    return math.random(2, 5)
end

--抢女子算分
local function add_girl_score(menpai)
    local girls =  get_girls(menpai)
    local prob = 100 - (#girls * 20)
    local is_ok = chance(prob)
    if is_ok then
        return 3
    end
    return 0
end

--辱杀女子算分
local function remove_girl_score(menpai)
    local girls =  get_girls(menpai)
    local prob = #girls * 20
    local is_ok = chance(prob)
    if is_ok then
        return 3
    end
    return 0
end

--攻击算分
local function attack_score(menpai)
    if chance(50) then
        return 0
    end
    local enemyCount = get_enemy_menpai_count(menpai)
    return 5 * enemyCount
end

function ai:get_role_of_class(classId)
    local result = nil
    local rolesForSelect = self.rolesForSelect or {}
    local role_level = self.role_level or 1
    local targets = table.where(rolesForSelect, function(r) return r.RoleClass == classId end)
    if #targets > 0 then
        result = table.pick_random(targets)
    end
    if result == nil then
        local use_substitute = chance(45)
        if use_substitute then
            if classId == "医师" then
                result = create_temp_role("被玩坏的女子", role_level)
            elseif classId == "刺客" then
                result = create_temp_role("豪猪刺客", role_level)
            elseif classId == "铁卫" then
                result = create_temp_role("豪猪堂主", role_level)
            elseif classId == "游侠" then
                result = create_temp_role("豪猪弓箭手",role_level)
            elseif classId == "侠士" then
                result = create_temp_role("豪猪土匪",role_level)
            else
                result = create_temp_role("豪猪土匪",role_level)
            end
        end
    end
    table.erase(rolesForSelect, result)
    return result
end

function ai:getformations(menpai, team)
    self:initRolesForSelection(menpai)
    local hemeng = self:pop_next_role_for_select("何猛", "豪猪土匪")
    local liangsheng = self:pop_next_role_for_select("梁胜", "豪猪堂主")
    local pmz = self:pop_next_role_for_select("潘麻子", "豪猪刺客")

    --防御阵型
    local defendFormation = {
        [1] = function()
            return{
                { Pos = 1, Role = self:get_role_of_class("侠士") },
                { Pos = 3, Role = liangsheng},
                { Pos = 4, Role = self:get_role_of_class("侠士") },
                { Pos = 5, Role = self:get_role_of_class("游侠") },
                { Pos = 6, Role = self:get_role_of_class("侠士") },
                { Pos = 7, Role = self:get_role_of_class("游侠") },
            }
        end,
        [2] = function()
            return{
                { Pos = 0, Role = self:get_role_of_class("侠士") },
                { Pos = 1, Role = self:get_role_of_class("医师") },
                { Pos = 3, Role = hemeng },
                { Pos = 4, Role = self:get_role_of_class("侠士") },
                { Pos = 5, Role = pmz },
                { Pos = 7, Role = self:get_role_of_class("医师") },
            }
        end,
        [3] = function()
            return {
                { Pos = 0, Role = liangsheng },
                { Pos = 1, Role = self:get_role_of_class("侠士") },
                { Pos = 2, Role = pmz },
                { Pos = 3, Role = hemeng },
                { Pos = 5, Role = self:get_role_of_class("游侠") },
                { Pos = 7, Role = self:get_role_of_class("医师") },
            }
        end,
        --收复阵型
        [4] = function ()
            return {
                { Pos = 1, Role = self:get_role_of_class("侠士") },
                { Pos = 3, Role = self:get_role_of_class("铁卫") },
                { Pos = 5, Role = self:get_role_of_class("医师") },
                { Pos = 7, Role = self:get_role_of_class("侠士") },
                { Pos = 8, Role = self:get_role_of_class("游侠") },
            }
        end
    }
    --进攻阵型
    local attackFormation = {
        [1] = function()
            return{
                { Pos = 1, Role = self:get_role_of_class("侠士") },
                { Pos = 3, Role = hemeng},
                { Pos = 4, Role = self:get_role_of_class("侠士") },
                { Pos = 5, Role = pmz},
                { Pos = 6, Role = self:get_role_of_class("侠士") },
                { Pos = 7, Role = self:get_role_of_class("游侠") },
            }
        end,
        [2] = function()
            return{
                { Pos = 0, Role = self:get_role_of_class("侠士") },
                { Pos = 2, Role = self:get_role_of_class("医师") },
                { Pos = 3, Role = hemeng },
                { Pos = 4, Role = self:get_role_of_class("刺客") },
                { Pos = 6, Role = liangsheng },
                { Pos = 8, Role = self:get_role_of_class("医师") },
            }
        end,
        [3] = function()
            return {
                { Pos = 0, Role = self:get_role_of_class("铁卫") },
                { Pos = 1, Role = self:get_role_of_class("侠士") },
                { Pos = 2, Role = pmz },
                { Pos = 3, Role = hemeng },
                { Pos = 5, Role = self:get_role_of_class("游侠") },
                { Pos = 7, Role = self:get_role_of_class("医师") },
            }
        end,
        [4] = function()
            return{
                { Pos = 0, Role = liangsheng },
                { Pos = 2, Role = pmz },
                { Pos = 3, Role = hemeng },
                { Pos = 4, Role = self:get_role_of_class("侠士") },
                { Pos = 5, Role = self:get_role_of_class("游侠") },
                { Pos = 7, Role = self:get_role_of_class("医师") },
            }
        end
    }
    if team == 1 then
        local idx = get_flag_int("攻打豪猪长垄阵型")
        if idx == 4 then
            return defendFormation[idx]()
        end
        if not defendFormation[idx] then
            idx = math.random(1, #defendFormation - 1)
        end
        return defendFormation[idx]()
    else
        local idx = get_flag_int("被豪猪长垄攻打阵型")
        if not attackFormation[idx] then
            idx = math.random(1, #attackFormation)
        end
        return attackFormation[idx]()
    end
end

function ai:getbattleTriggers(menpai, team)
    --防御触发器
    local defendBattleTriggers = {
        [1] = function()
            return {
                "梁胜开局",
                "梁胜大招",
            }
        end,
        [2] = function()
            return {
                "何猛开局",
                "潘麻子开局",
                "何猛大招",
                "潘麻子大招"
            }
        end,
        [3] = function()
            return {
                "何猛开局",
                "潘麻子开局",
                "梁胜开局",
                "何猛大招",
                "潘麻子大招",
                "梁胜大招",
            }
        end,
        --收复触发器
        [4] = function ()
            return {
            }
        end
    }
    --进攻触发器
    local attackBattleTriggers = {
        [1] = function()
            return {
                "何猛开局",
                "潘麻子开局",
                "何猛大招",
                "潘麻子大招"
            }
        end,
        [2] = function()
            return{
                "何猛开局",
                "梁胜开局",
                "何猛大招",
                "梁胜大招",
            }
        end,
        [3] = function()
            return {
                "何猛开局",
                "潘麻子开局",
                "何猛大招",
                "潘麻子大招"
            }
        end,
        [4] = function()
            return {
                "何猛开局",
                "潘麻子开局",
                "梁胜开局",
                "何猛大招",
                "潘麻子大招",
                "梁胜大招",
            }
        end
    }
    if team == 1 then
        local idx = get_flag_int("攻打豪猪长垄阵型")
        if defendBattleTriggers[idx] then
            return defendBattleTriggers[idx]()
        end
    else
        local idx = get_flag_int("被豪猪长垄攻打阵型")
        if attackBattleTriggers[idx] then
            return attackBattleTriggers[idx]()
        end
    end
end

ai.actions = {
    {
        getScore = attack_score,
        name = "正在考虑是否攻打敌对门派",
        execute = ai_decision.quick_attack
    },
    {
        getScore = adjust_score,
        name = "何猛正在操练下属",
        execute = ai_decision.adjust
    },
    {
        getScore = daze_score,
        name = "何猛正在选妃",
        execute = ai_decision.daze
    },
    {
        getScore = cure_score,
        name = "梁胜正在强迫女子为土匪们包扎伤口",
        execute = ai_decision.cure
    },
    {
        getScore = add_girl_score,
        name = "潘麻子正在强抢民女",
        execute = function(menpai)
            ai_decision.add_new_disciple(menpai, "被玩坏的女子")
        end
    },
    {
        getScore = remove_girl_score,
        name = "正在欺男霸女",
        execute = function(menpai)
           local girl = get_girls(menpai)[1]
           if girl then
                kill_disciple(girl)
           end
        end
    },
}

ai.maxActionCount = 2
ai.MaxDynamicLevel = 5

return ai
