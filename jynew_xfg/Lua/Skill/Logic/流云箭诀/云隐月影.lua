local skill =  skill_define("云隐月影")

function skill:OnCreate(args)
    add_buff("云隐月影", args.OwnerId)
    set_role_buff_int(args.OwnerId, "云隐月影", "云隐月影计数", 0)
end

return skill