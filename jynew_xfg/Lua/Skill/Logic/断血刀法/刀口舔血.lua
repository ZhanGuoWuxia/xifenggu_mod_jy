local skill =  skill_define("刀口舔血")

function skill:OnCreate(args)
    add_buff("刀口舔血", args.OwnerId)
    set_role_buff_int(args.OwnerId, "刀口舔血", "刀口舔血计数", 0)
end

return skill