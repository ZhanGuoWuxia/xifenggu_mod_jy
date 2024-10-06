local buff = buff_define("铁甲坚韧")
--被击后若自身存在护盾，则本场战斗永久提升2%防御(上限30%)

local addDefper = 0.02
local addDefperMax = 0.3

function buff:OnHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    local Defper = args.buff:GetStat(stat_key.DefensePercent)
    if role_shield_check(ownerId, ">", 0) then
        Defper = Defper + addDefper
        args.buff:SetStat(stat_key.DefensePercent, math.min(Defper, addDefperMax))
    end
end

return buff