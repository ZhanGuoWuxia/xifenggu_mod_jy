--每回合结束时，回复5%最大生命值
local bleed = buff_define("春风化雨")

local recoverFactor = 0.05

function bleed:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)
    local reHp = role_stat(ownerId, stat_key.MaxHp) * recoverFactor
    self:TryDoBuffHeal(args, ownerId, ownerId, reHp)
end

return bleed
