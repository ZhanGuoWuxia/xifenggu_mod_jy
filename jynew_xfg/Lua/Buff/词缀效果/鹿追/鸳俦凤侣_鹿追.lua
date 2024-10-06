local buff = buff_define("鸳俦凤侣_鹿追")

--和心仪之人同时在场时，自己减免伤害10%，韧性提升10%
function buff:OnAdd(args)
    local ownerId = self:GetBuffOwnerId(args)
    if is_role_in_team("司徒来也", team_of_role(ownerId)) then
        args.buff:SetStat(stat_key.ReceiveDamageModifer, 0.1)  -- 减伤
        args.buff:SetStat(stat_key.TenacityPercent, 0.1) --韧性
    end
end

function buff:OnOtherDeath(args)
    local ownerId = self:GetBuffOwnerId(args)
    if not is_role_in_team("司徒来也", team_of_role(ownerId)) then
        args.buff:SetStat(stat_key.ReceiveDamageModifer, 0)  -- 减伤
        args.buff:SetStat(stat_key.TenacityPercent, 0) --韧性
        remove_buff("鸳俦凤侣_鹿追", ownerId, ownerId)
    end
end

return buff