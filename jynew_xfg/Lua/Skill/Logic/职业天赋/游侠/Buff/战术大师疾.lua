local buff = buff_define("游侠_战术大师疾")
--当回合开始时，若角色在场上存活，能够提升友方所有单位100点速度值

--当回合开始时
function buff:OnRoundStart(args)
    local ownerId = self:GetBuffOwnerId(args)
    --获取友方存活角色
    local allies = get_team_alive_roles( team_of_role(ownerId) )
    --为存活的友方角色 提升速度
    for i, roleId in pairs(allies) do
        add_buff("游侠_疾速", roleId, ownerId)
    end
end

--当死亡时 消除自己施加的疾速BUFF
function buff:OnDeath(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local allies = get_roles_of_team(team_of_role(OwnerId))
    for i, roleId in pairs(allies) do
        remove_buff("游侠_疾速", roleId, OwnerId)
    end
end

return buff