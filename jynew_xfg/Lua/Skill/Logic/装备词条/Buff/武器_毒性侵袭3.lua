local buff = buff_define("武器_毒性侵袭3")

local PlusDamageRatio = 0.2

--对处于中毒的单位造成的伤害提升20%
function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    if role_has_buff(dmgInfo.TargetRoleId, "中毒") then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + PlusDamageRatio
    end
end

return buff