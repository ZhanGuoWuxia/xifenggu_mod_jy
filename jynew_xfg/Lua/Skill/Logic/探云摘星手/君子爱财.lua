local skill =  skill_define("君子爱财")

function skill:OnCreate(args)
    add_buff("君子爱财", args.OwnerId)
    set_role_buff_int(args.OwnerId, "君子爱财", "君子爱财计数", 0)
end

return skill