local skill = skill_define("蛤蟆功")
--全身涵劲蓄势蕴力不吐2回合，无法集气且闪避降低30%，受到攻击时减免30%伤害，并令目标[中毒]1层

function skill:OnCast(args)
    add_buff("蛤蟆功", args.CasterId, args.CasterId, 1, 2)
end

return skill