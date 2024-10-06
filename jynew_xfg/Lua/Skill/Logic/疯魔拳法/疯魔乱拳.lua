--疯魔掌法绝招
local skill = simple_damage_skill_template("疯魔乱拳", stat_key.Attack, 0.5)

function skill:OnCreate(args)
    add_buff("疯魔拳法暴击修正", args.OwnerId)
end

function skill:OnDestroy(args)
    remove_buff("疯魔拳法暴击修正", args.OwnerId)
end

return skill