local skill = simple_damage_skill_template("反击突刺", stat_key.Attack,0.7)
--若触发招架，反击对目标造成{{[stat:atk] * 0.7}}点外伤，反击的目标若存在10层中毒或流血，则100%对其晕眩

function skill:OnCreate(args)
    add_buff("反击突刺", args.OwnerId)
end

function skill:OnDestroy(args)
    remove_buff("反击突刺", args.OwnerId)
end

return skill