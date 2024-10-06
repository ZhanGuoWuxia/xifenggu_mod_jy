local skill = skill_define("移形换影")

function skill:OnCast(args)
    local CasterId = args.CasterId
    local allies = get_team_alive_roles(args.TargetParam.CastTeamSide)
    local lowest_hp_percent = math.maxinteger
    local swapRoleId = nil
    for _, roleId in pairs(allies) do
        if CasterId ~= roleId and role_hp_percent(roleId) <= lowest_hp_percent then
            lowest_hp_percent = role_hp_percent(roleId)
            swapRoleId = roleId
        end
    end
    if swapRoleId then 
        swap_role_pos(CasterId, swapRoleId)
    end
end

return skill