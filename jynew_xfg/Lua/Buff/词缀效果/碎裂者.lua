--对目标造成伤害时，若目标拥有护盾，此次伤害提升10%
local buff = buff_define("碎裂者")
local PlusDamageFactor = 0.1

function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    local targetId = dmgInfo.TargetRoleId
    local attakerId = dmgInfo.AttackRoleId
    if role_shield_check(targetId, ">", 0)  then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + PlusDamageFactor
    end
end

return buff
