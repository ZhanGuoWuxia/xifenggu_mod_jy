local buff = buff_define("伺机待发")
--闪避后提升20点暴击， 最多提升200点

local max_crit = 200
local add_crit = 20

function buff:OnDodge(args)
    local curCrit = args.buff:GetStat(stat_key.Crit) + add_crit
    curCrit = math.clamp(curCrit, 0, max_crit)
    args.buff:SetStat(stat_key.Crit, curCrit)
end

return buff