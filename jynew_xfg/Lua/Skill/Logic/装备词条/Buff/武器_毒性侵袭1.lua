local buff = buff_define("武器_毒性侵袭1")

local PlusDamageRatio = 0.1

--对处于中毒的单位造成的伤害提升10%
function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    if role_has_buff(dmgInfo.TargetRoleId, "中毒") then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + PlusDamageRatio
    end
end

return buff