--剧情待补充
local role = get_role_by_id("司徒来也")
if not role then
    print_error("未找到主角(player:fullname)")
    return
end

role.MaxBattleJoinCount = role.MaxBattleJoinCount + 1
role:ResetJoinBattleCount()

local msg = string.i18_format("{0}的上场次数增加了{1}次", role.Name, 1)
play_sfx("Tip/Tip1.wav")
pop_msg_box(msg)
