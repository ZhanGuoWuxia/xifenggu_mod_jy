
local hunt_configs = {
    ["熊"] =    { battleid = "熊之战", cooldown = 2 },
    ["狼"] =    { battleid = "狼之战", cooldown = 2  },
    ["羊"] =    { battleid = "羊之战", cooldown = 2  },
    ["野猪"] =  { battleid = "野猪之战", cooldown = 2 },
    ["蛇"] =    { battleid = "蛇之战", cooldown = 2 },

    ["熊大"] =    { battleid = "Boss_熊大", cooldown = 5, is_boss = true },
    ["刚鬃"] =    { battleid = "Boss_刚鬃", cooldown = 5, is_boss = true },
    ["狼王"] =    { battleid = "Boss_狼王", cooldown = 5, is_boss = true },
    ["咩咩"] =    { battleid = "Boss_咩咩", cooldown = 5, is_boss = true },
    ["冷牙"] =    { battleid = "Boss_冷牙", cooldown = 5, is_boss = true },
}

local hunt_appear_key = "狩猎刷新"


local function get_hunt_progress_key(huntId)
    return "狩猎计数_" .. huntId
end

local function start_hunt(area, huntId, onHuntSuccess, onHuntFail)

    local current_config = hunt_configs[huntId]
    if not current_config then
        print_error("Cannot find hunt Id: " .. huntId)
        return
    end
    local ret = start_preset_battle(current_config.battleid)
    if ret == 1 then
        local progressKey = get_hunt_progress_key(huntId)
        local huntCount = get_flag_int(progressKey)
        set_flag_int(progressKey, huntCount + 1)

        if onHuntSuccess then
            onHuntSuccess()
        end
    else
        if onHuntFail then
            onHuntFail()
        end
    end

    remove_area_flag(area, hunt_appear_key)
end

local function is_hunt_area(area)
    return has_area_flag(area, hunt_appear_key)
end

local function is_not_hunt_area(area)
    return not has_area_flag(area, hunt_appear_key)
end

local function get_hunt_max_count()
    local areas = areas_of_menpai(get_player_menpai())
    local totalAreaCount = #areas
    if totalAreaCount <= 1 then
        return 1
    end
    local res = math.floor(totalAreaCount * 0.5)
    res = math.max(1, res)
    return res
end

local function get_hunt_pick_num()
    local round = get_game_round()
    local cnt = 3 + math.floor(round / 5)
    return cnt
end

local function refresh_player_hunt()
    local player_areas = areas_of_menpai(get_player_menpai())
    local max_hunt_count = get_hunt_max_count()
    local areas_has_hunt = table.where(player_areas, is_hunt_area)    
    if #areas_has_hunt >= max_hunt_count then
        return
    end
    local areas_not_hunt = table.where(player_areas, is_not_hunt_area)
    if #areas_not_hunt == 0 then
        return
    end
    local pickNum = max_hunt_count - #areas_has_hunt
    pickNum = math.clamp(pickNum, 0, get_hunt_pick_num())
    local selectAreas = table.pick_random_many(areas_not_hunt, pickNum)
    for _, area in pairs(selectAreas) do
        set_area_flag(area, hunt_appear_key)
    end
end

return {
    start_hunt = start_hunt,
    refresh_player_hunt = refresh_player_hunt,
}
