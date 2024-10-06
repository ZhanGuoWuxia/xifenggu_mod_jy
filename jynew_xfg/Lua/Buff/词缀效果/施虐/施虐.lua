local buff = buff_define("施虐")
--对敌方造成伤害时会提升自身1%伤害施加，每有一名敌方目标被击败，提升10%的伤害加成，最高可获得100%的伤害加成

function buff:OnGiveDamage(args)

    local OwnerId = self:GetBuffOwnerId(args)
    add_buff("施虐计数", OwnerId, OwnerId, 1)
end

function buff:OnOtherDeath(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local DeathRoleId = args.DeathResult.DeathRoleId
    if not is_same_team(OwnerId, DeathRoleId) then
        add_buff("施虐计数", OwnerId, OwnerId, 10)
    end
end

return buff
