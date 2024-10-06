local skill = simple_damage_skill_template("穿云破雾", stat_key.Attack, 0.5)

function skill:OnCreate(args)
    add_buff("穿云破雾监听", args.OwnerId)
end

function skill:OnDestroy(args)
    remove_buff("穿云破雾监听", args.OwnerId)
end

return skill