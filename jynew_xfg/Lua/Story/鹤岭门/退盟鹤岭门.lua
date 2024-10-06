avg_talk("司徒来也", "赵左使，思虑再三，我们还是各自为政最好。")
avg_talk("赵让", "罢了！本来鹤岭门就是香儿的，我忝为照看。")
avg_talk("赵让", "既然你俩情深义重，生生世世，鹤岭门早晚和虎焰门合为一体，何不让这一天早点到来？")
avg_talk("赵让", "赵让就此献上鹤岭门。")

local areas = areas_of_menpai("鹤岭门")
for _, area in pairs(areas) do
    player_occupy_area(area)
end
destroy_menpai("鹤岭门")
set_flag("完成退盟鹤岭门")
