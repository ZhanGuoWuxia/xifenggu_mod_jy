local buildDevelopPoint = 10
local economy = require 'Common/economy'

local area = current_area
if not area then
    return
end

if area.Develop >= MaxAreaDevelop then
    pop_tip("建设度已达到最大值")
    return -1
end

local cost = economy.cost_of_build_area(area)

local is_ok = yes_or_no(string.i18_format("本次建设花费 {0} x {1}, 是否继续？", item_tip_link("银两", "银两", "#ff2400"), cost))
if not is_ok then
    return -1
end

local money = get_player_money()
if money < cost then
    pop_tip("没有足够的银两建设该地块")
    return -1
end

add_player_money(-cost)
change_area_develop(area, buildDevelopPoint)
