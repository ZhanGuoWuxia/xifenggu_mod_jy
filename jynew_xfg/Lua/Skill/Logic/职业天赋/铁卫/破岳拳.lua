local skill = skill_define("铁卫_破岳拳")
--当自身拥有护盾时，会消耗掉所有护盾值，将其一拳打出，对目标造成同等的伤害

function skill:GetSkillDamage(args)
    return role_stat(args.CasterId, stat_key.Shield) + role_stat(args.CasterId, stat_key.Attack)*0.3
end

function skill:OnCast(args)
    --获取角色护盾值
    local RoleShield = role_stat(args.CasterId, stat_key.Shield)
    --造成护盾值同等伤害
    self:TryDoSkillDamage(args)
    --扣除当前所有护盾值
    role_add_shield(args.CasterId,-(RoleShield))
end



return skill