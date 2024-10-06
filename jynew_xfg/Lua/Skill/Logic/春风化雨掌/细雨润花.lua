local skill = skill_define("细雨润花")

--对己方全体提升内力
function skill:OnCreate(args)
    --获取队伍存活角色列表
    local allies = get_team_alive_roles(team_of_role(args.OwnerId))
    --为存活的友方角色提升内力
    add_buff_to_roles("细雨润花", allies, args.OwnerId, 1, 5)
end

return skill