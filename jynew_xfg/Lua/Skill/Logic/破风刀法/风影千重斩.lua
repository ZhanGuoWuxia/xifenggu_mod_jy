local skill = simple_damage_skill_template("风影千重斩", stat_key.Attack, 1.3, 0.1)

function skill:OnCreate(args)
    add_buff("风影千重斩监听", args.OwnerId)
end

function skill:OnDestroy(args)
    remove_buff("风影千重斩监听", args.OwnerId)
end

return skill