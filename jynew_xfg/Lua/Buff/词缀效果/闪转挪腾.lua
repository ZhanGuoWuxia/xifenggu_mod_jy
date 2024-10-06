--每损失1%生命值提升3点闪避
local buff = buff_define("闪转挪腾")

local Hp2DodgeDivider = 0.01
local addDodge = 3

--涉及到生命值变化的机制建议用此事件触发
function buff:OnHpChange(args)
    local ownerId = buff_arg_owner(args)
    local losedHpPercent = role_losed_hp_percent(ownerId)
    local newDodgeLevel = (losedHpPercent / Hp2DodgeDivider) * addDodge
    if args.buff then
        args.buff:SetStat(stat_key.Dodge, newDodgeLevel)
    end
end

return buff
