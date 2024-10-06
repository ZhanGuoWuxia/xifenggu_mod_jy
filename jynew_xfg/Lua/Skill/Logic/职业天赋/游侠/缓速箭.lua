local skill = simple_damage_skill_template("游侠_缓速箭", stat_key.Attack, 0.5)
--对目标及其身后两侧的单位射出一支箭造成{{[stat:atk] * 0.5}}外伤。同时附加1层缓速效果，持续3回合

function skill:OnSkillHit(args)
    add_buff("缓速", args.HiterId, args.CasterId, 1, 3)
end

return skill