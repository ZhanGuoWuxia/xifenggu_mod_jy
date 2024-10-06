local area = current_area
if not area then
    return
end

if area.Develop <= 0 then
    pop_tip("建设度已达到最小值")
    return -1
end

local developPoint = 10

local economy = require("Common/economy")
local cost = economy.cost_of_build_area(area)

add_player_money(cost)
change_area_develop(area, -math.clamp(area.Develop, 0, developPoint))
