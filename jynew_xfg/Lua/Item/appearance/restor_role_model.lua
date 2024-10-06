local role = current_role
if not (role) then
    return
end
--还原选中的角色模型
restor_role_model(role)

return true