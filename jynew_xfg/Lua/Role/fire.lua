local role = current_role
if not role then
    return
end
local ret = yes_or_no(string.i18_format("确认将 {0} 解雇？", role.Name))
if ret then
    return player_fire_role(role)
else
    return false
end
