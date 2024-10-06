local skill = simple_damage_skill_template("熊_愤怒一击", stat_key.Attack, 1.4)

function skill:OnSkillHit(args)
    add_buff("晕眩", args.HiterId, args.CasterId, 1, 2)
end

return skill