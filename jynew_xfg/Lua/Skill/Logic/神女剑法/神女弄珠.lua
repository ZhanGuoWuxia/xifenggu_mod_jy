local skill =  skill_define("神女弄珠")

--对己方全体提升攻击
function skill:OnCreate(args)
    --获取队伍存活角色列表
    local allies = get_team_alive_roles(team_of_role(args.OwnerId))
    --为存活的友方角色提升攻击
    add_buff_to_roles("神女弄珠", allies, args.OwnerId, 1, 2)
end

return skill