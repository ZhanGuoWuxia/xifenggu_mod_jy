local skill = simple_damage_skill_template("霸王再世", stat_key.Attack, 0.5, 0.1)
--有{{[stat:atk] * 0.1}}%的几率在暴击时释放一次全屏攻击，造成{{[stat:atk] * 0.5}}点外伤

function skill:OnCreate(args)
    add_buff("霸王再世", args.OwnerId)
end

return skill