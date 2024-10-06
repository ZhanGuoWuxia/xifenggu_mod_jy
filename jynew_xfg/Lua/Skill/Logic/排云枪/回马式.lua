local skill = simple_damage_skill_template("回马式", stat_key.Attack, 0.8)
--有{{[stat:parry] * 0.15}}%的概率在己方其他角色被攻击时反击对方，造成{{[stat:atk] * 0.8}}点外伤 

function skill:OnCreate(args)
    add_buff("回马式监听", args.OwnerId)
end

function skill:OnDestroy(args)
    remove_buff("回马式监听", args.OwnerId)
end

return skill