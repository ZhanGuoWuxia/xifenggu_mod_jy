local ai_decision = require("AI/decisions")
local ai = class("画桥书苑AI", require('AI/template/ai_base'))
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
                result = create_temp_role("画桥书苑医师", role_level)
            elseif classId == "刺客" then
                result = create_temp_role("画桥书苑刺客", role_level)
            elseif classId == "铁卫" then
                result = create_temp_role("画桥书苑铁卫", role_level)
            elseif classId == "游侠" then
                result = create_temp_role("画桥书苑游侠",role_level)
            elseif classId == "侠士" then
                result = create_temp_role("画桥书苑侠士",role_level)
            else
                result = create_temp_role("画桥书苑侠士",role_level)
            end
        end
    end
    table.erase(rolesForSelect, result)
    return result
end

function ai:getformations(menpai, team)
    self:initRolesForSelection(menpai)
    local hejufeng = self:pop_next_role_for_select("何惧风", "画桥书苑医师")
    local lichangshi = self:pop_next_role_for_select("李场师", "画桥书苑侠士")
    local asheng = self:pop_next_role_for_select("阿生", "画桥书苑游侠")
    
    local defendFormation = {
        [1] = function()
            return{
                { Pos = 0, Role = self:get_role_of_class("铁卫") },
                { Pos = 2, Role = asheng },
                { Pos = 3, Role = self:get_role_of_class("铁卫") },
                { Pos = 4, Role = lichangshi },
                { Pos = 5, Role = self:get_role_of_class("刺客") },
                { Pos = 7, Role = self:get_role_of_class("医师") },
            }
        end,

        [2] = function()
            return{
                { Pos = 0, Role = self:get_role_of_class("铁卫") },
                { Pos = 2, Role = hejufeng },
                { Pos = 3, Role = self:get_role_of_class("铁卫") },
                { Pos = 5, Role = asheng },
                { Pos = 4, Role = self:get_role_of_class("刺客") },
                { Pos = 7, Role = self:get_role_of_class("医师") },
            }

        end,
        [3] = function()
            return {
                { Pos = 0, Role = self:get_role_of_class("铁卫") },
                { Pos = 2, Role = asheng },
                { Pos = 3, Role = self:get_role_of_class("铁卫") },
                { Pos = 5, Role = hejufeng },
                { Pos = 7, Role = lichangshi },
                { Pos = 8, Role = self:get_role_of_class("刺客") },
            }
        end
    }
    local attackFormation = {
        [1] = function()
            return{
                { Pos = 0, Role = self:get_role_of_class("铁卫") },
                { Pos = 2, Role = asheng },
                { Pos = 3, Role = self:get_role_of_class("铁卫") },
                { Pos = 4, Role = lichangshi },
                { Pos = 5, Role = self:get_role_of_class("刺客") },
                { Pos = 7, Role = self:get_role_of_class("医师") },
            }
        end,

        [2] = function()
            return{
                { Pos = 0, Role = self:get_role_of_class("铁卫") },
                { Pos = 2, Role = hejufeng },
                { Pos = 3, Role = self:get_role_of_class("铁卫") },
                { Pos = 5, Role = asheng },
                { Pos = 4, Role = self:get_role_of_class("刺客") },
                { Pos = 7, Role = self:get_role_of_class("医师") },
            }

        end,
        [3] = function()
            return {
                { Pos = 0, Role = self:get_role_of_class("铁卫") },
                { Pos = 2, Role = asheng },
                { Pos = 3, Role = self:get_role_of_class("铁卫") },
                { Pos = 5, Role = hejufeng },
                { Pos = 7, Role = lichangshi },
                { Pos = 8, Role = self:get_role_of_class("刺客") },
            }
        end,
    }
    if team == 1 then
        local idx = get_flag_int("攻打画桥书苑阵型")
        if not defendFormation[idx] then
            idx = math.random(1, #defendFormation)
        end
        return defendFormation[idx]()
    else
        local idx = get_flag_int("被画桥书苑攻打阵型")
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
        getScore = daze_score,
        name = "正在招募弟子",
        execute = ai_decision.add_random_disciple
    },
    {
        getScore = daze_score,
        name = "正在修炼",
        execute = ai_decision.daze
    },
    {
        getScore = build_score,
        name = "正在修建",
        execute = ai_decision.build
    },
    {
        getScore = adjust_score,
        name = "何惧风正在操练下属",
        execute = ai_decision.adjust
    },
}

ai.maxActionCount = 3
ai.MaxDynamicLevel = 30

return ai