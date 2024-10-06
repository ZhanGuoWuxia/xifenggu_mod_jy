local buff = buff_define("固若金汤")

--施展[拨云见日]后，提升自身(武学等级*命中人数)%招架，持续2回合
function buff:AfterSkillCast(args)
    if not args.Skill:IsSkill("拨云见日") then 
        return
    end

    --依据 (武学等级*命中人数)
    local addStatBasis = args.Skill.SkillLevel * args.TargetParam.Targets.Count * 0.01
    add_buff("回首招架", args.CasterId, args.CasterId, addStatBasis, 2)
end

return buff