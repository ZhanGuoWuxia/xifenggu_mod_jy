local skill =  skill_define("鹤鸣九天")

function skill:OnCreate(args)
    add_buff("鹤鸣九天", args.OwnerId)
    set_role_buff_int(args.OwnerId, "鹤鸣九天", "鹤鸣九天计数", 0)
end

return skill