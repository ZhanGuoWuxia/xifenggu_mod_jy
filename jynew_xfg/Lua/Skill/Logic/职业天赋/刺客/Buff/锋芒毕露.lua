local buff = buff_define("刺客_锋芒毕露")

local addCrtFactor = 100
--每击败一名单位，提升100点暴击值
function buff:OnKill(args)
    local ownerId = self:GetBuffOwnerId(args)
    local cnt = get_role_buff_int(ownerId, "刺客_锋芒毕露", "刺客_锋芒毕露计数")
    cnt = cnt + 1
    set_role_buff_int(ownerId, "刺客_锋芒毕露", "刺客_锋芒毕露计数", cnt)

    if args.buff then
        args.buff:SetStat(stat_key.Crit, addCrtFactor * cnt)
    end
end

return buff