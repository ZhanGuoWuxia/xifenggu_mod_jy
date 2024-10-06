local ai_decision = require("AI/decisions")
local ai = class("龙湾门AI", require('AI/template/ai_base'))
local diplomatic = require("Common/diplomatic")
local globalIdx = nil

--发呆算分
local function daze_score(menpai)
    return math.random(1, 5)
end

--动态跟随玩家等级算分
local function adjust_score(menpai)
    return math.random(2, 6)
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

--恢复伤势算分
local function cure_score(menpai)
    local woundRoles = table.where(roles_of_menpai(menpai), function(r) return r.IsWound end)
    local cnt = #woundRoles
    if cnt <= 0 then
        return -999
    end
    return math.random(2, 6)
end

--攻击算分
local function attack_score(menpai)
    local enemyCount = get_enemy_menpai_count(menpai)
    return math.random(3, 6) * enemyCount
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
        local use_substitute = chance(50)
        if use_substitute then
            if classId == "医师" then
                result = create_temp_role("龙湾大厨", role_level)
            elseif classId == "刺客" then
                result = create_temp_role("龙湾突袭者", role_level)
            elseif classId == "铁卫" then
                result = create_temp_role("龙湾门下人", role_level)
            elseif classId == "游侠" then
                result = create_temp_role("龙湾重弓手",role_level)
            elseif classId == "侠士" then
                result = create_temp_role("龙湾舞女",role_level)
            else
                result = create_temp_role("龙湾门下人",role_level)
            end
        end
    end
    table.erase(rolesForSelect, result)
    return result
end

function ai:getformations(menpai, team)
    self:initRolesForSelection(menpai)
    local df_li = self:pop_next_role_for_select("东方狸", "龙湾突袭者")
    local df_tun = self:pop_next_role_for_select("东方豚", "龙湾门下人")
    local df_sha = self:pop_next_role_for_select("东方鲨", "龙湾大厨")
    local lwy = self:pop_next_role_for_select("龙万莹", "龙湾舞女")
    local df_zhouyu = self:pop_next_role_for_select("东方骤雨", "龙湾重弓手")
    local defendFormation = {
        [1] = function()
            return{
                { Pos = 0, Role = self:get_role_of_class("刺客") },
                { Pos = 1, Role = self:get_role_of_class("刺客") },
                { Pos = 2, Role = self:get_role_of_class("医师") },
                { Pos = 4, Role = df_li},
                { Pos = 6, Role = self:get_role_of_class("刺客") },
                { Pos = 8, Role = self:get_role_of_class("医师") },
            }
        end,

        [2] = function()
            return{
                { Pos = 0, Role = self:get_role_of_class("铁卫") },
                { Pos = 2, Role = self:get_role_of_class("游侠") },
                { Pos = 3, Role = df_sha },
                { Pos = 4, Role = df_tun},
                { Pos = 6, Role = self:get_role_of_class("铁卫") },
                { Pos = 8, Role = self:get_role_of_class("游侠") },
            }
        end,
        [3] = function()
            return {
                { Pos = 0, Role = self:get_role_of_class("铁卫") },
                { Pos = 1, Role = df_sha },
                { Pos = 3, Role = self:get_role_of_class("铁卫") },
                { Pos = 6, Role = self:get_role_of_class("铁卫") },
                { Pos = 5, Role = self:get_role_of_class("医师") },
                { Pos = 7, Role = df_tun },
            }
        end,
        [4] = function()
            return {
                { Pos = 0, Role = df_sha },
                { Pos = 2, Role = df_tun },
                { Pos = 3, Role = self:get_role_of_class("铁卫") },
                { Pos = 4, Role = df_li },
                { Pos = 5, Role = df_zhouyu },
                { Pos = 7, Role = lwy },
            }
        end
    }
    local attackFormation = {
        [1] = function()
            return {
                { Pos = 0, Role = self:get_role_of_class("侠士") },
                { Pos = 1, Role = self:get_role_of_class("刺客") },
                { Pos = 2, Role = self:get_role_of_class("游侠") },
                { Pos = 3, Role = self:get_role_of_class("侠士") },
                { Pos = 5, Role = self:get_role_of_class("游侠") },
                { Pos = 4, Role = df_tun },
            }
        end,
        [2] = function()
            return {
                { Pos = 0, Role = self:get_role_of_class("刺客") },
                { Pos = 1, Role = self:get_role_of_class("侠士") },
                { Pos = 3, Role = df_sha },
                { Pos = 5, Role = df_tun},
                { Pos = 7, Role = self:get_role_of_class("游侠") },
            }
        end,
        [3] = function()
            return {
                { Pos = 1, Role = self:get_role_of_class("医师") },
                { Pos = 2, Role = self:get_role_of_class("刺客") },
                { Pos = 3, Role = self:get_role_of_class("侠士") },
                { Pos = 4, Role = df_li },
                { Pos = 6, Role = self:get_role_of_class("侠士") },
                { Pos = 8, Role = self:get_role_of_class("刺客") },

            }
        end,
        [4] = function()
            return {
                { Pos = 0, Role = df_tun },
                { Pos = 1, Role = self:get_role_of_class("医师") },
                { Pos = 3, Role = df_sha },
                { Pos = 4, Role = df_li },
                { Pos = 5, Role = df_zhouyu },
                { Pos = 7, Role = lwy },
            }
        end,
    }
    if team == 1 then
        local idx = get_flag_int("攻打龙湾门阵型")
        if not defendFormation[idx] then
            idx = math.random(1, #defendFormation)
            globalIdx = idx
        end
        return defendFormation[idx]()
    else
        local idx = get_flag_int("被龙湾门攻打阵型")
        if not attackFormation[idx] then
            idx = math.random(1, #attackFormation)
            globalIdx = idx
        end
        return attackFormation[idx]()
    end
end

function ai:getbattleTriggers(menpai, team)
    --防御触发器
    local defendBattleTriggers = {
        [1] = function()
            return {
                "东方狸开局",
                "东方狸大招",
            }
        end,
        [2] = function()
            return {
                "东方鲨开局",
                "东方豚开局",
                "东方鲨大招",
                "东方豚大招",
            }
        end,
        [3] = function()
            return {
                "东方鲨开局",
                "东方豚开局",
                "东方鲨大招",
                "东方豚大招",
            }
        end,
        [4] = function ()
            return {
                "东方鲨大招",
                "东方豚大招",
                "东方骤雨开局",
                "东方骤雨大招",
                "龙万莹大招",
                "东方狸大招"
            }
        end
    }
    --进攻触发器
    local attackBattleTriggers = {
        [1] = function()
            return {
                "东方豚开局",
                "东方豚大招",
            }
        end,
        [2] = function()
            return{
                "东方鲨开局",
                "东方豚开局",
                "东方鲨大招",
                "东方豚大招",
            }
        end,
        [3] = function()
            return {
                "东方狸开局",
                "东方狸大招",
            }
        end,
        [4] = function()
            return {
                "东方鲨大招",
                "东方豚大招",
                "东方骤雨开局",
                "东方骤雨大招",
                "龙万莹大招",
                "东方狸大招"
            }
        end
    }
    if team == 1 then
        local idx = get_flag_int("攻打龙湾门阵型")
        if defendBattleTriggers[idx] then
            return defendBattleTriggers[idx]()
        else
            return defendBattleTriggers[globalIdx]()
        end
    else
        local idx = get_flag_int("被龙湾门攻打阵型")
        if attackBattleTriggers[idx] then
            return attackBattleTriggers[idx]()
        else
            return attackBattleTriggers[globalIdx]()
        end
    end
end

ai.actions = function ()
    return CS.ZhanGuoWuxia.Lua.LuaBridge.HasFlag("完成龙万莹密谋起义") and {
        {
            getScore = diplomatic_score,
            name = "正在评估周边局势",
            execute = ai_decision.diplomatic
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
            name = "东方狸正在研习拳法",
            execute = ai_decision.daze
        },
        {
            getScore = adjust_score,
            name = "东方骤雨正在操练下属",
            execute = ai_decision.adjust
        },
        {
            getScore = daze_score,
            name = "东方豚正在画上描绘心上人",
            execute = ai_decision.daze
        },
    } or {
        {
            getScore = diplomatic_score,
            name = "正在评估周边局势",
            execute = ai_decision.diplomatic
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
            name = "东方狸正在研习拳法",
            execute = ai_decision.daze
        },
        {
            getScore = adjust_score,
            name = "东方骤雨正在操练下属",
            execute = ai_decision.adjust
        },
        {
            getScore = daze_score,
            name = "东方鲨正在召开海天盛筵",
            execute = ai_decision.daze
        },
        {
            getScore = daze_score,
            name = "东方豚正在画上描绘心上人",
            execute = ai_decision.daze
        },
        {
            getScore = cure_score,
            name = "龙万莹正在抚慰受伤的龙湾门人",
            execute = ai_decision.cure
        },
    }
end

ai.maxActionCount = 3
ai.MaxDynamicLevel = 10

return ai
