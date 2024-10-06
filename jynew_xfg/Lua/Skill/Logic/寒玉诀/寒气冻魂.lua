local skill = simple_damage_skill_template("寒气冻魂",stat_key.Attack, 0.05)
--对敌方全体注入一团寒气并造成{{[stat:atk] * 0.05}}点外伤，降低其200点速度和100点闪避值，持续2回合

function skill:OnSkillHit(args)
    add_buff("寒气冻魂", args.HiterId, args.CasterId, 1, 2)
end

return skill
