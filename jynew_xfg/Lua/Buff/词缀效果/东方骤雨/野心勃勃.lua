local buff = buff_define("野心勃勃")
--生命值高于80%时，攻击、暴击、内劲会得到一定的提升%。

local conditional_hp_percent = 0.8

local atkPercent = 0.2
local critLevel = 200
local intPercent = 0.2

local function RefreshStats(args)
    local OwnerId = buff_arg_owner(args)
    if role_hp_percent_check(OwnerId, ">=", conditional_hp_percent) then
        args.buff:SetStat(stat_key.AttackPercent, atkPercent)
        args.buff:SetStat(stat_key.InnerStrengthPercent, intPercent)
        args.buff:SetStat(stat_key.Crit, critLevel)
    else
        args.buff:SetStat(stat_key.AttackPercent, 0)
        args.buff:SetStat(stat_key.InnerStrengthPercent, 0)
        args.buff:SetStat(stat_key.Crit, 0)
    end
end

function buff:OnAdd(args)
    RefreshStats(args)
end

function buff:OnHpChange(args)
    RefreshStats(args)
end

return buff
