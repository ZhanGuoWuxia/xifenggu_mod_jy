local buff = buff_define("猛虎之力")

local addFactor = 225
--每击败一个目标，提升自身10%暴击率
function buff:OnKill(args)
    local ownerId = self:GetBuffOwnerId(args)
    local cnt = get_role_buff_int(ownerId, "猛虎之力", "猛虎之力计数")
    cnt = cnt + 1
    set_role_buff_int(ownerId, "猛虎之力", "猛虎之力计数", cnt)

    if args.buff then
        args.buff:SetStat(stat_key.Crit, addFactor * cnt)
    end
end

return buff