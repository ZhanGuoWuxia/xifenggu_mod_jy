--使用道具增加属性
print("add_attr")
local role = current_role
local addAttr = item_param
if not (role and addAttr) then
    return
end
role.AttrsSelf = role.AttrsSelf + addAttr
return true