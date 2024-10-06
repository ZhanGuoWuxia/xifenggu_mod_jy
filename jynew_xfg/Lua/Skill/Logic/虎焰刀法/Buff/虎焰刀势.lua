local buff = buff_define("虎焰刀势")

local addFactor = 0.1
--每击败一个目标，提升自身10%攻击力
function buff:OnKill(args)
    local ownerId = self:GetBuffOwnerId(args)
    local cnt = get_role_buff_int(ownerId, "虎焰刀势", "虎焰刀势计数")
    cnt = cnt + 1
    set_role_buff_int(ownerId, "虎焰刀势", "虎焰刀势计数", cnt)

    if args.buff then
        args.buff:SetStat(stat_key.AttackPercent, addFactor * cnt)
    end
end

return buff