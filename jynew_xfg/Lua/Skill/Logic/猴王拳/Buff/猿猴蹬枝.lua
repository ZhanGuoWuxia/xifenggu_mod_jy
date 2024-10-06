local buff = buff_define("猿猴蹬枝")
--施展[白猿献果]后追击，且此招式无法被招架和闪避，也无法造成暴击。并根据双方速度差值提升此次伤害，每相差10点提升1%,最高50%

--在buff携带者（攻击方）命中判定前
function buff:BeforeAttackerHit(args)
    if not args.Skill:IsSkill("猿猴蹬枝") then
        return
    end
    local hit_param = args.HitParam
    hit_param.AntiDodgeAddition = 10000
    hit_param.AntiParryAddition = 10000
end

--在buff携带者（攻击方）暴击判定前 可对CritParam进行修改来影响暴击计算结果
function buff:BeforeAttackerCrit(args)
    if not args.Skill:IsSkill("猿猴蹬枝") then
        return
    end

    args.CritParam.CritAddition = -10000
end

--根据双方速度差值提升此次伤害，每相差3点提升1%,最高50%
function buff:BeforeGiveDamage(args)
    if not args.DamageInfo.SourceSkillId == "猿猴蹬枝" then
        return
    end

    local ownerId = self:GetBuffOwnerId(args)
    local dmgInfo = args.DamageInfo
    local targetSpeed = role_stat(dmgInfo.TargetRoleId, stat_key.Speed)
    local ownerSpeed = role_stat(ownerId, stat_key.Speed)
    local speedDifferenceValue = math.abs(ownerSpeed - targetSpeed)
    dmgInfo.DamageRatio = dmgInfo.DamageRatio + math.min(speedDifferenceValue / 3 * 0.01 ,0.5)
end

--施展[白猿献果]后追击
function buff:AfterSkillCast(args)
    if not args.Skill:IsSkill("白猿献果") then
        return
    end

    local ownerId = self:GetBuffOwnerId(args)
    do_persue_skill(ownerId, "猿猴蹬枝", args.TargetParam.CastPosition , enemy_team_of_role(ownerId))
end

return buff