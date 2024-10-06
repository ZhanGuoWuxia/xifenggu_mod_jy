local skill = simple_damage_skill_template("回首一棍", stat_key.Attack, 0.8)
--若触发招架，有{{[stat:parry] * 0.1}}%几率施展回首一棍进行反击，对目标造成{{[stat:atk] * 0.8}}点外伤，并提升15%招架值，持续2回合

function skill:OnCreate(args)
    add_buff("回首一棍监听", args.OwnerId)
end

function skill:OnDestroy(args)
    remove_buff("回首一棍监听", args.OwnerId)
end

return skill