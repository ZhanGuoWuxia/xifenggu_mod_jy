local buff = buff_define("速射监听")

local coefficient = 0.2

--计算伤害时加上提升伤害的比例
function buff:BeforeGiveDamage(args)
    local ownerId = self:GetBuffOwnerId(args)
    local dmgInfo = args.DamageInfo
    if dmgInfo.SourceSkillId == "速射" and role_speed_check(ownerId, ">", dmgInfo.TargetRoleId)then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + coefficient
    end

end



return buff
