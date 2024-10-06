local skill = simple_damage_skill_template("剑雪千里", stat_key.Attack, 0.8)

function skill:OnCreate(args)
    add_buff("剑雪千里监听", args.OwnerId)
end

function skill:OnDestroy(args)
    remove_buff("剑雪千里监听", args.OwnerId)
end

return skill