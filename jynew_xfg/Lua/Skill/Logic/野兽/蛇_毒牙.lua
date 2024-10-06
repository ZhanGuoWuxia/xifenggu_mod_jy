local skill = simple_damage_skill_template("蛇_毒牙", stat_key.InnerStrength, 0.35)

function skill:OnSkillHit(args)
    add_buff("中毒", args.HiterId, args.CasterId, 2, 2)
end

return skill