local skill = simple_damage_skill_template("血爪击", stat_key.Attack, 1.2 , 0.1)

function skill:OnSkillHit(args)
    add_buff("流血", args.HiterId, args.CasterId, 1, 2)
end

return skill
