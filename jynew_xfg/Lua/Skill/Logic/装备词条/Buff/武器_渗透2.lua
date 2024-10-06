local buff = buff_define("武器_渗透2")

local PlusDamageRatio = 0.15

--对处于流血的单位造成的伤害提升15%
function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    if role_has_buff(dmgInfo.TargetRoleId, "流血") then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + PlusDamageRatio
    end
end

return buff