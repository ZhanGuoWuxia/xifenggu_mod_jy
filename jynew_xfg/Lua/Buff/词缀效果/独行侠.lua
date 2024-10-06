local buff = buff_define("独行侠")

--只上阵一名角色时，对面每上场一个单位，我方则每提升6%攻击和生命值
function buff:OnAdd(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local allies = get_team_alive_roles(team_of_role(OwnerId))

    local atkPercent = (#get_team_alive_roles(enemy_team_of_role(OwnerId))) *0.06
    local intPercent = (#get_team_alive_roles(enemy_team_of_role(OwnerId))) *0.06
    local maxHpPercent = (#get_team_alive_roles(enemy_team_of_role(OwnerId))) *0.06


    if #allies == 1 then
        local buff = args.buff
        if buff then
            buff:SetStat(stat_key.AttackPercent, atkPercent)
            buff:SetStat(stat_key.InnerStrength, intPercent)
            buff:SetStat(stat_key.MaxHpPercent, maxHpPercent)
        end
    end
end

return buff
