local skill = skill_define("侠士_激励")
--战斗开始后，3个回合内友方所有单位提升5%攻击力

function skill:OnCast(args)
    --获取友方存活角色
    local allies = get_team_alive_roles( team_of_role(args.CasterId) )
    --为存活的友方角色 提升攻击
    for i, roleId in pairs(allies) do
        add_buff("攻击提升", roleId, args.CasterId, 5, 3)
    end
end

return skill