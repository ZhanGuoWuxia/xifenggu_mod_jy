local skill = simple_damage_skill_template("下剑", stat_key.Attack, 1.3)

function skill:OnSkillHit(args)
    add_buff("韧性弱化", args.HiterId, args.CasterId, 10, 2)
    add_buff("招架弱化", args.HiterId, args.CasterId, 10, 2)
end

return skill