local buff = buff_define("巨熊之力")
--攻击命中敌人时,附加攻击者5%最大生命值的外伤

local atk_factor = 0.05

function buff:OnDoHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    local dmg = role_stat(ownerId, stat_key.MaxHp) * atk_factor
    for _, targetId in pairs(args.Targets) do
        self:TryDoBuffDamage(args, ownerId, targetId, dmg)
    end
end

return buff