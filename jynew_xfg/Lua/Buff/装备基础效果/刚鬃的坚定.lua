local buff = buff_define("刚鬃的坚定")
--生命值低于25%时，防御提升125%,获得的治疗效果提升50%。

local conditional_hp_percent = 0.25

local DefPercentToAdd = 1.25
local ReceiveHealModifierToAdd = 0.5

local function RefreshStats(args)
    local OwnerId = buff_arg_owner(args)
    if role_hp_percent_check(OwnerId, "<=", conditional_hp_percent) then
        args.buff:SetStat(stat_key.DefensePercent, DefPercentToAdd)
        args.buff:SetStat(stat_key.ReceiveHealModifier, ReceiveHealModifierToAdd)
    else
        args.buff:SetStat(stat_key.DefensePercent, 0)
        args.buff:SetStat(stat_key.ReceiveHealModifier, 0)
    end
end

function buff:OnAdd(args)
    RefreshStats(args)
end

function buff:OnHpChange(args)
    RefreshStats(args)
end

return buff
