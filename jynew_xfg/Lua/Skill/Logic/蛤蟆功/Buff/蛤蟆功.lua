local buff = buff_define("蛤蟆功")
--受到攻击令目标[中毒]1层

function buff:OnReceiveDamage(args)
    local dmgInfo = args.DamageInfo
    local targetRoleId = dmgInfo.AttackRoleId
    local ownerId = self:GetBuffOwnerId(args)
    add_buff("中毒", targetRoleId, ownerId, 1, 2)
end

return buff