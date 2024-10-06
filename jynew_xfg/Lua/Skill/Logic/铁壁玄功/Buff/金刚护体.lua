local buff = buff_define("金刚护体")
--生命值首次低于50%时，提升自身10%防御和10%韧性

--每次受到攻击后，判断下气血是不是低于50%
function buff:OnHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    local cnt = get_role_buff_int(ownerId, "金刚护体", "金刚护体_计数")
    if role_hp_percent(ownerId) <= 0.5 and cnt == 0 then
        set_role_buff_int(ownerId, "金刚护体", "金刚护体_计数", 1)
        args.buff:SetStat(stat_key.Tenacity, 100)
        args.buff:SetStat(stat_key.DefensePercent, 0.1)
    end
end

return buff