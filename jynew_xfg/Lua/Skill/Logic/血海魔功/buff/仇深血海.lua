--每回合结束时，回复一定量气血值
local buff = buff_define("仇深血海")

function buff:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)
    local reHp = role_stat(ownerId, stat_key.InnerStrength) * 0.2
    self:TryDoBuffHeal(args, ownerId, ownerId, reHp)
end

return buff