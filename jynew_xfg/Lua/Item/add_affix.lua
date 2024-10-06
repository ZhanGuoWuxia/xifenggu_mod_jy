--使用道具增加词缀
local role = current_role

if not (role) then
    return
end

--AffixID：词缀Id
--AffixLifeCount：持续战斗次数(对永久性词缀无效)
for AffixID, AffixLifeCount in pairs(item_param) do
    --添加角色词缀
    role_add_affix(role, AffixID, AffixLifeCount)
end

return true