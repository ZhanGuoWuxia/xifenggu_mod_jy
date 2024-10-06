local buff = buff_define("武器_渗透1")

local PlusDamageRatio = 0.1

--对处于流血的单位造成的伤害提升10%
function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    if role_has_buff(dmgInfo.TargetRoleId, "流血") then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + PlusDamageRatio
    end
end

return buff