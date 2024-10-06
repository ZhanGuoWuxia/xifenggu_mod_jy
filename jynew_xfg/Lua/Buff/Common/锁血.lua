local buff = buff_define("锁血")

--锁血
function buff:BeforeReceiveDamage(args)
    local dmgInfo = args.DamageInfo
    dmgInfo.TempValue = 0
    dmgInfo.DamageRatio = 0
end

function buff:OnReceiveDamage(args)
    local ownerId = self:GetBuffOwnerId(args)
    local reHp = role_stat(ownerId, stat_key.MaxHp)
    self:TryDoBuffHeal(args, ownerId, ownerId, reHp)
end

return buff