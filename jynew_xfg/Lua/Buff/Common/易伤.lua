local buff = buff_define("易伤")
local damagefactor = 0.01

--每层使受到的伤害提升1%
function buff:BeforeReceiveDamage(args)
    local dmgInfo = args.DamageInfo
    local pile = self:GetBuffPile(args)
    dmgInfo.DamageRatio = dmgInfo.DamageRatio + damagefactor * pile
end

return buff