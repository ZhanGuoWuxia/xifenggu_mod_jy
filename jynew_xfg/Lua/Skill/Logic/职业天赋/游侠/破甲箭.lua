local skill = simple_damage_skill_template("游侠_破甲箭", stat_key.Attack, 0.5)
--对目标射出一支破甲箭造成{{[stat:atk] * 0.5}}外伤。同时附加1层破甲效果，持续3回合

function skill:OnSkillHit(args)
    add_buff("破甲", args.HiterId, args.CasterId, 1, 3)
end

return skill