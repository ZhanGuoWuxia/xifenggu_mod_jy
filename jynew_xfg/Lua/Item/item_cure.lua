--使用道具恢复伤势
local role = current_role
local param = item_param
if not role or not param then
    return
end
if role.HealthStatus >= CS.ZhanGuoWuxia.Backend.GameConst.MaxHealthStatus then
    pop_tip("该角色没有受伤")
    return false
end
for k,v in pairs(param) do
    print(k, v, param[k])
end

--key为string的话, C#字典没法以dic[key]的形式访问，详见 https://github.com/Tencent/xLua/issues/707
local cureValue = param:get_Item("cure")

cure_wound(role, cureValue)
return true