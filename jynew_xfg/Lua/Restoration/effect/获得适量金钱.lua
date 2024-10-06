--剧情待补充
local reducedDevelop = 1
local player_menpai = get_player_menpai()
if not player_menpai then
    return
end
local economy = require "Common/economy"
local money = economy.income_of_menpai(player_menpai)
add_player_money(money)

for _, area in pairs(areas_of_menpai(player_menpai)) do
    change_area_develop(area, -reducedDevelop)
end

pop_msg_box(string.i18_format("所有领地发展度降低了<color=red>{0}</color>点", reducedDevelop))
