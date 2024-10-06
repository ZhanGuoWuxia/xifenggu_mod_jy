local skill = simple_damage_skill_template("野猪_冲刺", stat_key.Attack, 0.8)

function skill:OnSkillHit(args)
    add_buff("破甲", args.HiterId, args.CasterId, 1, 3)
end

return skill