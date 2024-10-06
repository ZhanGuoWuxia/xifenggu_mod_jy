local buff = buff_define("饰品_紫电残影")
--若目标速度低于自身，对其造成的伤害<color=green>提升</color>10%；若目标速度高于自身，被其造成的伤害<color=green>减少</color>10%

local addDamageRatio = 0.1
local reduceDamageRatio = 0.1

--若目标速度低于自身，对其造成的伤害<color=green>提升</color>10%
function buff:BeforeGiveDamage(args)
    local ownerId = self:GetBuffOwnerId(args)
    local dmgInfo = args.DamageInfo
    local targetRoleId = dmgInfo.TargetRoleId
    if role_speed_check(ownerId, ">", targetRoleId) then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + addDamageRatio
        self:NotifyTriggered(args)
    end
end



--若目标速度高于自身，被其造成的伤害<color=green>减少</color>10%
function buff:BeforeReceiveDamage(args)
    local ownerId = self:GetBuffOwnerId(args)
    local dmgInfo = args.DamageInfo
    local targetRoleId = dmgInfo.AttackRoleId
    if role_speed_check(ownerId, "<", targetRoleId) then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio - reduceDamageRatio
        self:NotifyTriggered(args)
    end
end

return buff