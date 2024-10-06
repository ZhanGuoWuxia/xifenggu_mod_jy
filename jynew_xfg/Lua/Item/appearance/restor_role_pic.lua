local role = current_role
if not (role) then
    return
end
--还原选中的角色立绘
restor_role_pic(role)

return true