--剧情待补充
local player_roles = roles_of_menpai(get_player_menpai())
for i, role in pairs(player_roles) do
    role:ChangeFavor(1)
    role_add_affix(role, "酒足饭饱", 3)
end
local msg = string.i18_format("所有人酒足饭饱，好感度也得到了提升")
play_sfx("Tip/Tip1.wav")
pop_msg_box(msg)

