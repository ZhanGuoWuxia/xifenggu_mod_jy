local role = current_role
local pic = table.first_or_nil(item_param.Keys)
if not (role) and not pic then
    return
end
--改变选中的角色立绘
set_role_pic(role, pic)

return true