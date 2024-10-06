local skill = simple_damage_skill_template("医师_毒针", stat_key.InnerStrength, 0.8)
--对目标释放毒针，造成100%内劲的内伤，并使其中毒3回合

function skill:OnSkillHit(args)
    add_buff("中毒", args.HiterId, args.CasterId, 1, 3)
end

return skill