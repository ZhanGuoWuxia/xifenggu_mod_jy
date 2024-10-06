local buff = buff_define("夜影步法")

--布阵在前列时，自身闪避率提高5%。布阵在中后列时，自身暴击率提高5%
function buff:OnRoundStart(args)
    local OwnerId = self:GetBuffOwnerId(args)
    --判断角色在哪一列
    local roleCol = col_of_role(OwnerId)
    --前列 闪避率提高5%
    if roleCol == 0 then
        args.buff:SetStat(stat_key.Dodge, 50)
    else
        --中 后列 暴击率提高5%
        args.buff:SetStat(stat_key.Crit, 50)
    end
end

return buff