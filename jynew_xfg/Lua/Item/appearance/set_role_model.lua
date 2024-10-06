local role = current_role
local modelId = table.first_or_nil(item_param.Keys)
if not (role) and not modelId then
    return
end
--改变选中的角色模型
set_role_model(role, modelId)

return true