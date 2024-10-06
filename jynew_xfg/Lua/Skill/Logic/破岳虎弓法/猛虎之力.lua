local skill =  skill_define("猛虎之力")

function skill:OnCreate(args)
    add_buff("猛虎之力", args.OwnerId)
    set_role_buff_int(args.OwnerId, "猛虎之力", "猛虎之力计数", 0)
end

return skill