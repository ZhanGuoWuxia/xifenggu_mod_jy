--每损失3%生命值提升10点暴击
--暴击概率公式为 critlevel / (critlevel + 1300)
--注:暴击率是由暴击数值传入公式后得来的
--因此所有修改暴击的地方实际上都是修改暴击的critlevel而非概率值
local buff = buff_define("狼血觉醒")

local Hp2CritDivider = 0.03
local critLevel = 10

--涉及到生命值变化的机制建议用此事件触发
function buff:OnHpChange(args)
    local ownerId = buff_arg_owner(args)
    local losedHpPercent = role_losed_hp_percent(ownerId)
    local newCritLevel = (losedHpPercent / Hp2CritDivider) * critLevel
    if args.buff then
        args.buff:SetStat(stat_key.Crit, newCritLevel)
    end
end

return buff
