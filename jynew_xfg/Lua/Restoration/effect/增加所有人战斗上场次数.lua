--剧情待补充

local player_roles = roles_of_menpai(get_player_menpai())
for i, role in pairs(player_roles) do
    role.MaxBattleJoinCount = role.MaxBattleJoinCount + 1
    role.RemainBattleJoinCount = role.RemainBattleJoinCount + 1
end
local msg = string.i18_format("所有人的可上场次数增加了1次")
play_sfx("Tip/Tip1.wav")
pop_msg_box(msg)

