local skill = simple_damage_skill_template("血饮斩", stat_key.Attack, 1.4)

function skill:OnCreate(args)
    add_buff("血饮斩", args.OwnerId)
end

function skill:OnDestroy(args)
    remove_buff("血饮斩", args.OwnerId)
end

return skill