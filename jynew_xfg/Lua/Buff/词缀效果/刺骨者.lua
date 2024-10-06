local buff = buff_define("刺骨者")

local PlusDamageRatio = 0.1

--对目标造成伤害时，若目标没有护盾，对其造成的伤害提升10%
function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    local targetRoleId = dmgInfo.TargetRoleId
    if role_shield_check(targetRoleId, "<=", 0)  then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + PlusDamageRatio
        self:NotifyTriggered(args)
    end
end

return buff
