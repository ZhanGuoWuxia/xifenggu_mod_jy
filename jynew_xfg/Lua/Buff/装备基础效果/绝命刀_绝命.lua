local buff = buff_define("绝命刀_绝命")
--对无护盾的目标造成伤害时，附加目标已损失生命值的50%，且不超过自身150%攻击的伤害

local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType
function buff:OnDoHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    for _, targetId in pairs(args.Targets) do
        --判断护盾值
        if role_shield_check(targetId, "<=", 0) and role_hp_percent(targetId) < 1 then
            --目标 最大生命值-当前生命值
            local hp = role_stat(targetId, stat_key.MaxHp) - role_stat(targetId, stat_key.CurrentHp)
            --自身攻击力
            local attack =  role_stat(ownerId, stat_key.Attack)
            local dmg = math.min(hp * 0.5,  attack * 1.5)
            self:TryDoBuffDamage(args, ownerId, targetId, dmg, DamageType.Physical)
        end
    end
end

return buff