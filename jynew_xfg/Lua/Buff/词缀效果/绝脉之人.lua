--以无法集气为代价，对敌人提升30%伤害
local buff = buff_define("绝脉之人")

local PlusDamageRatio = 0.3

function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    dmgInfo.DamageRatio = dmgInfo.DamageRatio + PlusDamageRatio
end

return buff
