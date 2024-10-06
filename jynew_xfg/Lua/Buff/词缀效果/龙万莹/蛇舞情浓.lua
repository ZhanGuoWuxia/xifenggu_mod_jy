local buff = buff_define("蛇舞情浓")

--和情郎在场时，受其庇护,收到的伤害降低30%
function buff:OnAdd(args)
    local ownerId = self:GetBuffOwnerId(args)
    if is_role_in_team("司徒来也", team_of_role(ownerId)) then
        args.buff:SetStat(stat_key.ReceiveDamageModifer, 0.3)
    else
        remove_buff("蛇舞情浓", ownerId, ownerId)
    end
end

function buff:OnOtherDeath(args)
    local ownerId = self:GetBuffOwnerId(args)
    if not is_role_in_team("司徒来也", team_of_role(ownerId)) then
        args.buff:SetStat(stat_key.ReceiveDamageModifer, 0)  -- 伤害加成
        remove_buff("蛇舞情浓", ownerId, ownerId)
    end
end

return buff