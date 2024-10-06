local buff = buff_define("血怒")
--每损失3%生命值提升1%攻击力, 最多可以提升33%攻击力

local Hp2AttackMultipier = 0.33

local function RefreshAttackPercent(args)
    local OwnerId = buff_arg_owner(args)
    local losedHpPercent = role_losed_hp_percent(OwnerId)
    local atkPercent = losedHpPercent * Hp2AttackMultipier
    args.buff:SetStat(stat_key.AttackPercent, atkPercent)
end

function buff:OnAdd(args)
    RefreshAttackPercent(args)
end

function buff:OnHpChange(args)
    RefreshAttackPercent(args)
end

return buff
