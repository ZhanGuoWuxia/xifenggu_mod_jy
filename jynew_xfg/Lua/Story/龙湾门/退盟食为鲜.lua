avg_talk("司徒来也", "夫人，思虑再三，我们还是各自为政最好。")
avg_talk("龙万莹", "也好！我本就不贪恋在息风谷有一席之地。")
avg_talk("龙万莹", "食为鲜就托付给虎焰门了，这样我就可以隐退江湖，守着宋郎和鲨儿，过些平淡的日子。")

local areas = areas_of_menpai("食为鲜")
for _, area in pairs(areas) do
    player_occupy_area(area)
end
destroy_menpai("食为鲜")
set_flag("完成退盟食为鲜")
