local role = current_role
if not role then
    return
end
local ret = yes_or_no(string.i18_format("确认将 {0} 逐出门派？", role.Name))
if ret then
    return leave_menpai(role)
else
    return false
end
