local buff = buff_define("乾坤同调")

--施展[雀翎风暴]后，每命中1名敌人，自身提升5%攻击力，持续1回合
function buff:AfterSkillCast(args)
    if not args.Skill:IsSkill("雀翎风暴") then 
        return
    end

    local count = args.TargetParam.Targets.Count

    local ownerId = self:GetBuffOwnerId(args)
    --获取友方存活角色
    local allies = get_team_alive_roles( team_of_role(ownerId) )
    --为存活的友方角色 提升攻击
    for i, roleId in pairs(allies) do
        if(roleId ~= ownerId) then
            add_buff("攻击提升", roleId, ownerId, count * 5, 1)
        end
    end
    
end

return buff