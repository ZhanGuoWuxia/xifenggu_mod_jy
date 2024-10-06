local buff = buff_define("复仇")
--每有一名友方目标死亡，提升5%所受伤害，最高可获得25%

function buff:OnOtherDeath(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local DeathRoleId = args.DeathResult.DeathRoleId
    if is_same_team(OwnerId, DeathRoleId) then
        add_buff("复仇计数", OwnerId, OwnerId, 1)
    end
end

return buff
