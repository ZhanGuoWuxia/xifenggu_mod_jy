local skill = simple_damage_skill_template("医师_灵蛇毒针", stat_key.InnerStrength, 0.6)
--对目标释放一枚穿透毒针，对目标一行单位造成60%内劲的内伤，并使其中毒2回合

function skill:OnSkillHit(args)
    add_buff("中毒", args.HiterId, args.CasterId, 1, 2)
end

return skill