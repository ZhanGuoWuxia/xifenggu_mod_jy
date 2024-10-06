local skill = simple_damage_skill_template("臭屁箭", stat_key.Attack, 1.2)

function skill:OnSkillHit(args)
    add_buff("恶心", args.HiterId, args.CasterId, 3, 2)
end

return skill