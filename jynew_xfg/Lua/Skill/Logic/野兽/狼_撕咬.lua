local skill = simple_damage_skill_template("狼_撕咬", stat_key.Attack, 1.2)

function skill:OnSkillHit(args)
    add_buff("流血", args.HiterId, args.CasterId, 1, 3)
end

return skill