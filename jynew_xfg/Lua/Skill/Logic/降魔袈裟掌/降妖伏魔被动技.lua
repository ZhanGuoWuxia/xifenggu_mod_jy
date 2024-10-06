local skill = simple_damage_skill_template("降妖伏魔被动技", stat_key.Attack, 0.8)
--降妖伏魔被动 连携攻击

function skill:OnCreate(args)
    add_buff("降妖伏魔", args.OwnerId)
end

function skill:OnDestroy(args)
    remove_buff("降妖伏魔", args.OwnerId)
end