local territory = current_territory
if not territory then
    print_error("目标攻防不存在")
    return false
end
local area = territory.DisputedArea
if not area then
    print_error("目标地块不存在")
    return
end

local increaseFirePoint = 5
local flagKey = "first_occupy_" .. tostring(area.Id)
set_flag(flagKey)

restore_api.add_fire_point(increaseFirePoint)
