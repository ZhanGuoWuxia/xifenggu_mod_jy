--剧情待补充
local role = get_role_by_id("司徒来也")
if not role then
    return
end
role_add_affix(role, "天命之人")
play_sfx("Tip/Tip1.wav")
pop_msg_box(string.i18_format("{0}现在拥有了主角光环", role.Name))
