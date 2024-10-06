local ai_decision = require("AI/decisions")
local ai = class("灵猹仙洞AI", require('AI/template/ai_base'))
local diplomatic = require("Common/diplomatic")

--发呆算分
local function daze_score(menpai)
    return math.random(1, 5)
end

--动态跟随玩家等级算分
local function adjust_score(menpai)
    return math.random(2, 6)
end

local function build_score(menpai)
    local areas = areas_of_menpai(menpai)
    if #areas <= 0 then
        return -999
    end
    return math.random(1, 5)
end

--外交算分
local function diplomatic_score(ai_menpai)
    local otherMenpais = get_unlocked_other_menpais(ai_menpai)
    local count = 0
    for _, menpai in pairs(otherMenpais) do
        local friendship = diplomatic.get_friendship(ai_menpai, menpai)
        if friendship <= -100 or friendship >= 100 then
            count = count + 1
        end
    end
    return 10 * count
end

--攻击算分
local function attack_score(menpai)
    if chance(50) then
        return 0
    end
    --攻击到地方只有最后一个领地就停手
    for _, enemy_menpai in pairs(get_enemy_menpais(menpai)) do
        local areas = areas_of_menpai(enemy_menpai)
        if #areas <= 1 then
            return -999
        end
    end
    local enemyCount = get_enemy_menpai_count(menpai)
    return math.random(2, 5) * enemyCount
end

local function gift_score()
    return math.random(1, 5)
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
        local use_substitute = chance(60)
        if use_substitute then
            if classId == "医师" then
                result = create_temp_role("灵猹仙洞医师", role_level)
            elseif classId == "刺客" then
                result = create_temp_role("灵猹仙洞刺客", role_level)
            elseif classId == "铁卫" then
                result = create_temp_role("灵猹仙洞铁卫", role_level)
            elseif classId == "游侠" then
                result = create_temp_role("灵猹仙洞游侠",role_level)
            elseif classId == "侠士" then
                result = create_temp_role("灵猹仙洞侠士",role_level)
            else
                result = create_temp_role("灵猹仙洞侠士",role_level)
            end
        end
    end
    table.erase(rolesForSelect, result)
    return result
end

function ai:getformations(menpai, team)
    self:initRolesForSelection(menpai)
    local xia1 = self:pop_next_role_for_select("夏大", "灵猹仙洞侠士")
    local xia2 = self:pop_next_role_for_select("夏二", "灵猹仙洞医师")
    local xia3 = self:pop_next_role_for_select("夏三", "灵猹仙洞刺客")
    local xia4 = self:pop_next_role_for_select("夏四", "灵猹仙洞游侠")
    local xia5 = self:pop_next_role_for_select("夏五", "灵猹仙洞侠士")
    local xia6 = self:pop_next_role_for_select("夏六", "灵猹仙洞铁卫")
    local defendFormation = {
        [1] = function()
            return{
                { Pos = 0, Role = xia5 },
                { Pos = 2, Role = self:get_role_of_class("刺客") },
                { Pos = 3, Role = xia6 },
                { Pos = 4, Role = self:get_role_of_class("医师") },
                { Pos = 5, Role = xia2 },
                { Pos = 7, Role = self:get_role_of_class("游侠") },
            }
        end,

        [2] = function()
            return{
                { Pos = 1, Role = self:get_role_of_class("侠士") },
                { Pos = 3, Role = xia6 },
                { Pos = 5, Role = xia5 },
                { Pos = 6, Role = self:get_role_of_class("侠士") },
                { Pos = 7, Role = self:get_role_of_class("医师") },
                { Pos = 8, Role = xia4 },
            }

        end,
        [3] = function()
            return {
                { Pos = 0, Role = xia5 },
                { Pos = 3, Role = xia6 },
                { Pos = 2, Role = self:get_role_of_class("游侠") },
                { Pos = 4, Role = xia1 },
                { Pos = 5, Role = xia2 },
                { Pos = 6, Role = self:get_role_of_class("刺客") },
            }
        end
    }
    local attackFormation = {
        [1] = function()
            return{
                { Pos = 0, Role = xia5 },
                { Pos = 2, Role = self:get_role_of_class("刺客") },
                { Pos = 3, Role = xia6 },
                { Pos = 4, Role = self:get_role_of_class("医师") },
                { Pos = 5, Role = xia2 },
                { Pos = 7, Role = self:get_role_of_class("游侠") },
            }
        end,

        [2] = function()
            return{
                { Pos = 1, Role = self:get_role_of_class("侠士") },
                { Pos = 3, Role = xia6 },
                { Pos = 5, Role = xia5 },
                { Pos = 6, Role = self:get_role_of_class("侠士") },
                { Pos = 7, Role = self:get_role_of_class("医师") },
                { Pos = 8, Role = xia4 },
            }

        end,
        [3] = function()
            return {
                { Pos = 0, Role = xia5 },
                { Pos = 3, Role = xia6 },
                { Pos = 2, Role = self:get_role_of_class("游侠") },
                { Pos = 4, Role = xia1 },
                { Pos = 5, Role = xia2 },
                { Pos = 6, Role = self:get_role_of_class("刺客") },
            }
        end,
        [4] = function()
            return {
                { Pos = 0, Role = xia5 },
                { Pos = 3, Role = xia6 },
                { Pos = 3, Role = xia4 },
                { Pos = 4, Role = xia1 },
                { Pos = 5, Role = xia2 },
                { Pos = 3, Role = xia3 },
            }
        end,
    }
    if team == 1 then
        local idx = get_flag_int("攻打灵猹仙洞阵型")
        if not defendFormation[idx] then
            idx = math.random(1, #defendFormation)
        end
        return defendFormation[idx]()
    else
        local idx = get_flag_int("被灵猹仙洞攻打阵型")
        if not attackFormation[idx] then
            idx = math.random(1, #attackFormation)
        end
        return attackFormation[idx]()
    end
end

ai.actions = {
    {
        getScore = diplomatic_score,
        name = "正在评估你的门派实力",
        execute = ai_decision.daze
    },
    {
        getScore = attack_score,
        name = "正在考虑是否攻打敌对门派",
        execute = ai_decision.quick_attack
    },
    {
        getScore = gift_score,
        name = "正在考虑送礼",
        execute = ai_decision.gift
    },
    {
        getScore = daze_score,
        name = "正在招募弟子",
        execute = ai_decision.add_random_disciple
    },
    {
        getScore = daze_score,
        name = "夏三正在仙洞里修炼",
        execute = ai_decision.daze
    },
    {
        getScore = build_score,
        name = "夏二正在铺盖茅屋",
        execute = ai_decision.build
    },
    {
        getScore = adjust_score,
        name = "夏大正在操练下属",
        execute = ai_decision.adjust
    },
}

ai.maxActionCount = 3
ai.MaxDynamicLevel = 15

return ai