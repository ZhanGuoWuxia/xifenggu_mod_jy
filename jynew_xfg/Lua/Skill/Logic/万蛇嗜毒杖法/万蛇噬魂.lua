local skill = simple_damage_skill_template("万蛇噬魂", stat_key.Attack, 0.3)

function skill:OnSkillHit(args)
    add_buff("中毒", args.HiterId, args.CasterId, 2, 2)
end

return skill