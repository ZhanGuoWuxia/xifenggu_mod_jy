local skill = simple_damage_skill_template("雀翎风暴", stat_key.Attack, 0.5, 0.1)

function skill:OnSkillHit(args)
    add_buff("流血", args.HiterId, args.CasterId, 1, 3)
end

return skill