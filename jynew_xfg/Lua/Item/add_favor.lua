--使用道具增加favor
local role = current_role
local param = item_param
if not role or not param then
    return
end
if role.Favor >= MaxRoleFavor then
    pop_tip("该角色已达到最大好感度")
    return false
end
--key为string的话, C#字典没法以dic[key]的形式访问，详见 https://github.com/Tencent/xLua/issues/707
local favor = param:get_Item("favor")
change_favor(role, favor)
return true