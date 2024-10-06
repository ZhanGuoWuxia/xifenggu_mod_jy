local skill = simple_damage_skill_template("放血", stat_key.Attack, 0.4)

function skill:OnSkillHit(args)
    add_buff("流血", args.HiterId, args.CasterId, 2, 4)
end

return skill
