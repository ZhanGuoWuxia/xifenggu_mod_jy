local skill = simple_damage_skill_template("涟漪千层", stat_key.Attack, 0.7)


function skill:OnSkillHit(args)
    add_buff("攻击弱化", args.HiterId, args.CasterId, 10, 3)
end

return skill