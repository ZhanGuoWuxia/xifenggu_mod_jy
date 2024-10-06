local skill = simple_damage_skill_template("毒杖横扫", stat_key.Attack, 0.5)

function skill:OnSkillHit(args)
    add_buff("中毒", args.HiterId, args.CasterId, 1, 2)
end

return skill