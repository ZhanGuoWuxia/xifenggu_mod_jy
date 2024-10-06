local buff = buff_define("铁卫_铁血守御")
local HpFactor = 0.3

--当队友生命值低于30%被攻击时，替其承受此次伤害
function buff:OnAllyBeAttacked(args)
    local defenderId = args.DefenderId
    local OwnerId = self:GetBuffOwnerId(args)
    local GetDefenderCurrentHp = role_stat(defenderId, stat_key.CurrentHp)
    local GetDefenderMaxHp = role_stat(defenderId, stat_key.MaxHp)

    --判断被攻击的队友当前生命值是否低于最大生命值30%
    if(GetDefenderCurrentHp <= GetDefenderMaxHp * HpFactor)then
        --挡刀
        do_block_skill(OwnerId, defenderId, args.DamageInfo, pos_of_role(defenderId), team_of_role(defenderId))
    end
end

return buff