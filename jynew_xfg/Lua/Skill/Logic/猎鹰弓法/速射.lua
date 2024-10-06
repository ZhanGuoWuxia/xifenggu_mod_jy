local skill = simple_damage_skill_template("速射", stat_key.Attack, 1, 0.1)

function skill:OnCreate(args)
    add_buff("速射监听", args.OwnerId)
end

function skill:OnDestroy(args)
    remove_buff("速射监听", args.OwnerId)
end

return skill