local skill = simple_damage_skill_template("翎羽双箭", stat_key.Attack, 0.5)

function skill:OnCreate(args)
    add_buff("翎羽双箭监听", args.OwnerId)
end

return skill