local role = get_role_by_id("司徒来也")
if not role then
    return false
end

return role:IsLevelMax() and role.Favor >= MaxRoleFavor
