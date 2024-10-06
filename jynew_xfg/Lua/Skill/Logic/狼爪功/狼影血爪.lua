local skill = simple_damage_skill_template("狼影血爪", stat_key.Attack, 0.8)


function skill:OnSkillHit(args)
    add_buff("流血", args.HiterId, args.CasterId, 1, 2)
end

return skill
