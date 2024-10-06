local buff = buff_define("娇艳欲滴")

--被击败后会令己方所有男性角色愤怒，提升10%的伤害加成和10%受伤加深
function buff:OnDeath(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local allies = get_team_alive_roles(team_of_role(OwnerId))
    for i, roleId in pairs(allies) do
        if OwnerId ~= roleId and is_role_male(roleId) then
            add_buff("愤怒", roleId, OwnerId, 1, -1)
        end
    end
end

return buff