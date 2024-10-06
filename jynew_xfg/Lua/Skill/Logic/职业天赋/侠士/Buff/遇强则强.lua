local buff = buff_define("侠士_遇强则强")
--对目标造成伤害时，若目标当前生命值百分比高于自己，对其造成的伤害提升20%

local PlusDamageFactor = 0.2 --提升的伤害


function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    local targetId = dmgInfo.TargetRoleId
    local ownerId = self:GetBuffOwnerId(args)
    if role_hp_percent_check(ownerId, "<", targetId) then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + PlusDamageFactor
    end
end

return buff