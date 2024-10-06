local skill = skill_define("醉花阴")

--施放技能后，接下来3次攻击计算暴击值+1000

function skill:OnCast(args)
    local CasterId = args.CasterId
    add_buff("醉生梦死", CasterId, CasterId)
    set_role_buff_int(CasterId, "醉生梦死", "醉生梦死计数", 3)
end

return skill