local buff = buff_define("鸳俦凤侣_司徒来也")

--和心仪之人同时在场时，自己提升伤害10%，韧性提升10%
function buff:OnAdd(args)
    local ownerId = self:GetBuffOwnerId(args)
    if is_role_in_team("鹿追", team_of_role(ownerId)) then
        args.buff:SetStat(stat_key.DoDamageModifier, 0.1)  -- 伤害加成
        args.buff:SetStat(stat_key.TenacityPercent, 0.1) --韧性
    end
end

function buff:OnOtherDeath(args)
    local ownerId = self:GetBuffOwnerId(args)
    if not is_role_in_team("鹿追", team_of_role(ownerId)) then
        args.buff:SetStat(stat_key.DoDamageModifier, 0)  -- 伤害加成
        args.buff:SetStat(stat_key.TenacityPercent, 0) --韧性
        remove_buff("鸳俦凤侣_司徒来也", ownerId, ownerId)
    end
end

return buff