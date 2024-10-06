local skill =  skill_define("刺客_锋芒毕露")
--每击败一名单位，提升100点暴击值

function skill:OnCreate(args)
    add_buff("刺客_锋芒毕露", args.OwnerId)
    set_role_buff_int(args.OwnerId, "刺客_锋芒毕露", "刺客_锋芒毕露计数", 0)
end

return skill