local skill = passive_define("暗藏杀机", "暗藏杀机")
--有{{[stat:crt] * 0.05}}%的几率在暴击时再次随机攻击场上一名敌人，造成{{[stat:atk] * 0.8}}点伤害

function skill:GetSkillDamage(args)
    return role_stat(args.CasterId, stat_key.Attack) * 0.8
end

function skill:OnCast(args)
    self:TryDoSkillDamage(args)
end

return skill