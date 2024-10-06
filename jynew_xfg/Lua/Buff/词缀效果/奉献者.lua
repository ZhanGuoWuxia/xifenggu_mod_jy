local buff = buff_define("奉献者")

--被击败时，随机选择一名受伤的友方角色，治疗其20%最大生命值。

local healPercent = 0.2

function buff:OnDeath(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local hurt_roles = get_team_hurt_roles(team_of_role(OwnerId))
    local hurt_allies = table.where(hurt_roles, function(roleId) return roleId ~= OwnerId end)
    if #hurt_allies > 0 then
        local healRoleId = table.pick_random(hurt_allies)
        local reHp = role_stat(healRoleId, stat_key.MaxHp) * healPercent
        self:TryDoBuffHeal(args, OwnerId, healRoleId, reHp)
    end
end

return buff