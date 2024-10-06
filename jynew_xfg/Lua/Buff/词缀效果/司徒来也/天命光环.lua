--造成伤害提升3%
local buff = buff_define("天命光环")

local plusDamageRatio = 0.03

function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    dmgInfo.DamageRatio = dmgInfo.DamageRatio + plusDamageRatio
end

return buff
