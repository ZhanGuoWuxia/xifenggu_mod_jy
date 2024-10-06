avg_talk("赵让", "(player:fname)掌门，这段时日我观你待香儿确实尽心尽力。")
avg_talk("赵让", "既然你俩情深义重，生生世世，不如让虎焰门和鹤岭门合并，我也愿效犬马之劳！")
avg_talk("司徒来也", "赵左使言重了，今后请多多指教。")

local areas = areas_of_menpai("鹤岭门")
for _, area in pairs(areas) do
    player_occupy_area(area)
end
destroy_menpai("鹤岭门")
player_add_disciple("赵让")
