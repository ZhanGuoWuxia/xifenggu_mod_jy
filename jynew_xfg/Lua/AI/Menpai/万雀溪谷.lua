local ai_decision = require("AI/decisions")
local ai = class("万雀溪谷AI", require('AI/template/ai_base'))
local diplomatic = require("Common/diplomatic")

--吸收算分
local function absorb_score(menpai)
    return 10
end

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
    local enemyCount = get_enemy_menpai_count(menpai)
    return math.random(3, 6) * enemyCount
end

local function absorb(menpai)
    local developPoint = 0
    local areas = areas_of_menpai(menpai)
    for _, area in pairs(areas) do

        if area then
            if area.Develop <= 0 then
                goto continue
            else
                developPoint = math.clamp(area.Develop, 0, math.random(5, 10))
                if developPoint > 0 then
                    pop_tip(string.i18_format("万壑成利用{0}吸取{1}发展度，恐怖如斯！", affix_tip_link("血色魔阵", "血色魔阵", "#FF7A00"), area.Name))
                    change_area_develop(area, -developPoint)
                end
                break
            end
            ::continue::
        end
    end
    if developPoint > 0 then
        set_flag_int("吸收发展度", get_flag_int("吸收发展度") + developPoint)
    else
        set_flag("万雀溪谷宣战")
    end
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
                result = create_temp_role("万雀溪谷祭司", role_level)
            elseif classId == "刺客" then
                result = create_temp_role("万雀溪谷温泉师", role_level)
            elseif classId == "铁卫" then
                result = create_temp_role("万雀溪谷风水师", role_level)
            elseif classId == "游侠" then
                result = create_temp_role("万雀溪谷秘阵师",role_level)
            elseif classId == "侠士" then
                result = create_temp_role("万雀溪谷侍女",role_level)
            else
                result = create_temp_role("万雀溪谷侍女",role_level)
            end
        end
    end
    table.erase(rolesForSelect, result)
    return result
end

function ai:getformations(menpai, team)
    self:initRolesForSelection(menpai)
    local wanhecheng = self:pop_next_role_for_select("万壑成", "万雀溪谷风水师")
    local dingxuan = self:pop_next_role_for_select("丁宣", "万雀溪谷秘阵师")
    local rouer = self:pop_next_role_for_select("柔儿", "万雀溪谷侍女")
    local defendFormation = {
        [1] = function()
            return{
                { Pos = 0, Role = self:get_role_of_class("侠士") },
                { Pos = 1, Role = self:get_role_of_class("铁卫") },
                { Pos = 2, Role = self:get_role_of_class("医师") },
                { Pos = 4, Role = wanhecheng},
                { Pos = 6, Role = self:get_role_of_class("侠士") },
                { Pos = 7, Role = self:get_role_of_class("铁卫") },
                { Pos = 8, Role = self:get_role_of_class("医师") },
            }
        end,

        [2] = function()
            return{
                { Pos = 0, Role = self:get_role_of_class("铁卫") },
                { Pos = 1, Role = self:get_role_of_class("游侠") },
                { Pos = 2, Role = self:get_role_of_class("医师") },
                { Pos = 3, Role = dingxuan },
                { Pos = 4, Role = wanhecheng},
                { Pos = 6, Role = self:get_role_of_class("铁卫") },
                { Pos = 7, Role = self:get_role_of_class("游侠") },
                { Pos = 8, Role = self:get_role_of_class("医师") },
            }
        end,
        [3] = function()
            return {
                { Pos = 0, Role = self:get_role_of_class("医师") },
                { Pos = 3, Role = self:get_role_of_class("医师") },
                { Pos = 6, Role = rouer },
                { Pos = 1, Role = dingxuan },
                { Pos = 7, Role = wanhecheng },
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
                { Pos = 4, Role = dingxuan },
                { Pos = 6, Role = self:get_role_of_class("侠士") },
                { Pos = 7, Role = self:get_role_of_class("刺客") },
                { Pos = 8, Role = self:get_role_of_class("游侠") },
            }
        end,
        [2] = function()
            return {
                { Pos = 0, Role = self:get_role_of_class("侠士") },
                { Pos = 1, Role = self:get_role_of_class("刺客") },
                { Pos = 2, Role = self:get_role_of_class("游侠") },
                { Pos = 3, Role = self:get_role_of_class("侠士") },
                { Pos = 5, Role = self:get_role_of_class("游侠") },
                { Pos = 4, Role = dingxuan },
                { Pos = 6, Role = wanhecheng},
                { Pos = 7, Role = self:get_role_of_class("刺客") },
                { Pos = 8, Role = self:get_role_of_class("游侠") },
            }
        end,
        [3] = function()
            return {
                { Pos = 0, Role = self:get_role_of_class("侠士") },
                { Pos = 1, Role = self:get_role_of_class("侠士") },
                { Pos = 2, Role = dingxuan },
                { Pos = 3, Role = self:get_role_of_class("铁卫") },
                { Pos = 5, Role = rouer },
                { Pos = 6, Role = self:get_role_of_class("侠士") },
                { Pos = 7, Role = self:get_role_of_class("侠士") },
                { Pos = 8, Role = wanhecheng },

            }
        end,
        [4] = function()
            return {
                { Pos = 0, Role = self:get_role_of_class("侠士") },
                { Pos = 1, Role = dingxuan },
                { Pos = 2, Role = self:get_role_of_class("医师") },
                { Pos = 3, Role = self:get_role_of_class("铁卫") },
                { Pos = 5, Role = self:get_role_of_class("游侠") },
                { Pos = 6, Role = self:get_role_of_class("侠士") },
                { Pos = 7, Role = wanhecheng },
                { Pos = 8, Role = rouer },
            }
        end,
    }
    if team == 1 then
        local idx = get_flag_int("攻打万雀溪谷阵型")
        if not defendFormation[idx] then
            idx = math.random(1, #defendFormation)
        end
        return defendFormation[idx]()
    else
        local idx = get_flag_int("被万雀溪谷攻打阵型")
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
                "万壑成开局",
                "万壑成大招",
            }
        end,
        [2] = function()
            return {
                "万壑成开局",
                "丁宣开局",
                "万壑成大招",
                "丁宣大招",
            }
        end,
        [3] = function()
            return {
                "万壑成开局",
                "万壑成大招",
                "丁宣大招",
                "柔儿大招"
            }
        end
    }
    --进攻触发器
    local attackBattleTriggers = {
        [1] = function()
            return {
                "丁宣开局",
                "丁宣大招",
            }
        end,
        [2] = function()
            return{
                "万壑成开局",
                "丁宣开局",
                "万壑成大招",
                "丁宣大招",
            }
        end,
        [3] = function()
            return {
                "万壑成开局",
                "万壑成大招",
                "丁宣大招",
                "柔儿大招"
            }
        end,
        [4] = function()
            return {
                "万壑成开局",
                "万壑成大招",
                "丁宣大招",
                "柔儿大招"
            }
        end
    }
    if team == 1 then
        local idx = get_flag_int("攻打万雀溪谷阵型")
        if defendBattleTriggers[idx] then
            return defendBattleTriggers[idx]()
        end
    else
        local idx = get_flag_int("被万雀溪谷攻打阵型")
        if attackBattleTriggers[idx] then
            return attackBattleTriggers[idx]()
        end
    end
end

ai.actions = function ()
    return CS.ZhanGuoWuxia.Lua.LuaBridge.HasFlag("完成血祭邪阵") and {
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
            getScore = absorb_score,
            name = "万壑成正在吸收天地精华",
            execute = absorb
        },
        {
            getScore = build_score,
            name = "丁宣正在加固阵法",
            execute = ai_decision.build
        },
        {
            getScore = daze_score,
            name = "柔儿正在沐浴",
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
            name = "柔儿正在沐浴",
            execute = ai_decision.daze
        },
        {
            getScore = build_score,
            name = "丁宣正在修建园林",
            execute = ai_decision.build
        },
        {
            getScore = adjust_score,
            name = "万壑成正在厉兵秣马",
            execute = ai_decision.adjust
        },
    }
end

ai.maxActionCount = 3
ai.MaxDynamicLevel = 15

return ai
