local role = current_role

if not (role) then
    return
end

--param：模型ID 和 立绘
--num : 1为模型  2为立绘
for param ,num in pairs(item_param) do
    if(num == 1) then
        set_role_model(role, param)
    elseif(num == 2) then
        set_role_pic(role, param)
    end
end

return true