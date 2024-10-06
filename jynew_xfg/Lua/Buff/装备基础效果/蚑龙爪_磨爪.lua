--每回合开始时，暴击得到提升，相当于20%的当前闪避值
local buff = buff_define("蚑龙爪_磨爪")

local Dodge2CritMultipier = 0.2

local function RefreshCrit(args)
    local OwnerId = buff_arg_owner(args)
    local current_dodge = role_stat(OwnerId, stat_key.Dodge)
    local plusedCrit = current_dodge * Dodge2CritMultipier
    args.buff:SetStat(stat_key.Crit, plusedCrit)
end

function buff:OnRoundStart(args)
    RefreshCrit(args)
end

return buff
