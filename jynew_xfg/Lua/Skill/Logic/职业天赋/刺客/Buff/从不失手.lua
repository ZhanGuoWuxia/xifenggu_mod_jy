local buff = buff_define("刺客_从不失手")

--每当自身攻击被目标闪避，下次发起攻击时提升25%的伤害，或再被次闪避则下次攻击再提升25%，最多提升100%
function buff:OnBeDodged(args)
    local ownerId = self:GetBuffOwnerId(args)
    local cnt = get_role_buff_int(ownerId, "刺客_从不失手", "刺客_从不失手计数")
    cnt = cnt + 1
    set_role_buff_int(ownerId, "刺客_从不失手", "刺客_从不失手计数", cnt)

    if args.buff then
        args.buff:SetStat(stat_key.DoDamageModifier, 0.25 * math.min(cnt, 4) )
    end
end

function buff:OnDoHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    set_role_buff_int(ownerId, "刺客_从不失手", "刺客_从不失手计数", 0)
    if args.buff then
        args.buff:SetStat(stat_key.DoDamageModifier, 0)
    end
end

return buff