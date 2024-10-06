local buff = buff_define("云绕明月")


--使用[流云箭影]后，所有队友命中提升20，持续2回合
function buff:AfterSkillCast(args)
    if not args.Skill:IsSkill("流云箭影") then 
        return
    end

    local ownerId = self:GetBuffOwnerId(args)
    --获取友方存活角色
    local allies = get_team_alive_roles( team_of_role(ownerId) )
    --为存活的友方角色 提升命中
    for i, roleId in pairs(allies) do
        add_buff("命中提升", roleId, ownerId, 2, 2)
    end

end

return buff