local skill = skill_define("羊_冲锋")

--技能伤害
local SkillDamageScale = 1

function skill:GetSkillDamage(args)
    return role_stat(args.CasterId, stat_key.Attack) * SkillDamageScale
end

function skill:OnCast(args)
    --依据 (武学等级*命中人数)
    local hitCount = args.TargetParam.Targets.Count
    add_buff("免伤提升", args.CasterId, args.CasterId, hitCount * 10, 2)
end

return skill