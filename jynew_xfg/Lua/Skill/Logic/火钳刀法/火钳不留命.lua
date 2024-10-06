local skill = simple_damage_skill_template("火钳不留命", stat_key.Attack, 1.3, 0.1)
--使用[普通攻击]或者[夹火刀]进行攻击后，如果目标生命低于5%,则追加攻击，造成({{[stat:atk] * 1.3}})点外伤

function skill:OnCreate(args)
    add_buff("火钳不留命", args.OwnerId)
end

function skill:OnDestroy(args)
    remove_buff("火钳不留命", args.OwnerId)
end

return skill
