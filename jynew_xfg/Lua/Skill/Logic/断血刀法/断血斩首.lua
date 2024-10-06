local skill = simple_damage_skill_template("断血斩首", stat_key.Attack, 1.3, 0.1)

function skill:OnCreate(args)
    add_buff("断血斩首", args.OwnerId)
end

return skill