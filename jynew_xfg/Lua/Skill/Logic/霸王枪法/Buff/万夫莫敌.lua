local buff = buff_define("万夫莫敌")

local HpAttackMultipier = 0.05  -- 提升5%攻击力
local HpLossThreshold = 0.10   -- 每损失10%生命值触发提升

local function RefreshAttackPercent(args)
    local OwnerId = buff_arg_owner(args)
    local currentHpPercent = role_hp_percent(OwnerId)

    -- 计算已损失生命值的百分比
    local lostHpPercent = 1 - currentHpPercent

    -- 计算提升的攻击力百分比
    local atkPercent = math.floor(lostHpPercent / HpLossThreshold) * HpAttackMultipier

    args.buff:SetStat(stat_key.AttackPercent, atkPercent)
end

function buff:OnAdd(args)
    RefreshAttackPercent(args)
end

function buff:OnHpChange(args)
    RefreshAttackPercent(args)
end

return buff
