local buff = buff_define("福豕镯_受疗")
--在战斗中，气血首次低于40%时，接下来的战斗自身所受到的治疗效果提升50%

--每次受到攻击后，判断下气血是不是低于40%
function buff:OnHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    local cnt = get_role_buff_int(ownerId, "福豕镯_受疗", "福豕镯_受疗_计数")
    if role_hp_percent(ownerId) <= 0.4 and cnt == 0 then
        set_role_buff_int(ownerId, "福豕镯_受疗", "福豕镯_受疗_计数", 1)
        args.buff:SetStat(stat_key.ReceiveHealModifier, 0.5)
    end
end

return buff