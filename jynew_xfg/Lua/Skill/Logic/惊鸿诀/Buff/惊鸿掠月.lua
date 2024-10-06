local buff = buff_define("惊鸿掠月")

local addCrit = 40  --基础提升的暴击率
local critMax = 200    --暴击率最多可提升
local addReceiveDamage = -0.08  --伤害加深
local ReceiveDamageMax = -0.4    --伤害加深最多可提升

--每次触发暴击后，提升4%暴击率（上限20%），但自身受到伤害也会加深8%（上限40%）
function buff:OnDoCrit(args)
    local crit = args.buff:GetStat(stat_key.Crit)
    local receiveDamage = args.buff:GetStat(stat_key.ReceiveDamageModifer)
    crit = crit + addCrit

    receiveDamage = receiveDamage + addReceiveDamage
    args.buff:SetStat(stat_key.Crit, math.min(crit, critMax))
    args.buff:SetStat(stat_key.ReceiveDamageModifer, math.max(receiveDamage, ReceiveDamageMax))
end

return buff