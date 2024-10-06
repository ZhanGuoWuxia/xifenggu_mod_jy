local skill = skill_define("挪转乾坤")

function skill:OnCast(args)
    local CasterId = args.CasterId

    local frontRoleId = alive_role_of_front(CasterId)
    local backRoleId = alive_role_of_back(CasterId)
    if frontRoleId ~= -1 and backRoleId ~= -1 then 
        swap_role_pos(frontRoleId, backRoleId)
        add_buff("生生不息", frontRoleId, CasterId, 1 , 2)
    elseif frontRoleId ~= -1 then
        swap_role_pos(frontRoleId, CasterId)
        add_buff("生生不息", frontRoleId, CasterId, 1 , 2)
    elseif backRoleId ~= -1 then
        swap_role_pos(backRoleId, CasterId)
        add_buff("生生不息", CasterId, CasterId, 1 , 2)
    else
        --do nothing
    end
end

return skill