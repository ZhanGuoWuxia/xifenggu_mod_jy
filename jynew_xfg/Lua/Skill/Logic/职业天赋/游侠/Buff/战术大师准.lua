local buff = buff_define("游侠_战术大师准")
--当回合开始时，若角色在场上存活，能够提升友方所有单位50点命中值

--当回合开始时
function buff:OnRoundStart(args)
    local ownerId = self:GetBuffOwnerId(args)
    --获取友方存活角色
    local allies = get_team_alive_roles( team_of_role(ownerId) )
    --为存活的友方角色 提升命中
    for i, roleId in pairs(allies) do
        add_buff("游侠_命中", roleId, ownerId)
    end
end

--当死亡时 消除自己施加的命中BUFF
function buff:OnDeath(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local allies = get_roles_of_team(team_of_role(OwnerId))
    for i, roleId in pairs(allies) do
        remove_buff("游侠_命中", roleId, OwnerId)
    end
end

return buff