local skill =  skill_define("虎焰刀势")
--每击杀一个目标，提升自身10%攻击力

function skill:OnCreate(args)
    add_buff("虎焰刀势", args.OwnerId)
    set_role_buff_int(args.OwnerId, "虎焰刀势", "虎焰刀势计数", 0)
end

return skill