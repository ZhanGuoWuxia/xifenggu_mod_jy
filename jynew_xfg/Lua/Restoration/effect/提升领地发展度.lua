--剧情待补充
local areas = areas_of_menpai(get_player_menpai())
for i, area in pairs(areas) do
    change_area_develop(area, 3)
end
play_sfx("Tip/Tip1.wav")
pop_msg_box("所有领地都得到了一定发展")
