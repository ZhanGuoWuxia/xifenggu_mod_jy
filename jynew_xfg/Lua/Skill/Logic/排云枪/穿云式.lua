local skill =  simple_damage_skill_template("穿云式", stat_key.Attack, 1)

function skill:OnSkillHit(args)
    add_buff("破甲", args.HiterId, args.CasterId, 1, 3)
end

return skill