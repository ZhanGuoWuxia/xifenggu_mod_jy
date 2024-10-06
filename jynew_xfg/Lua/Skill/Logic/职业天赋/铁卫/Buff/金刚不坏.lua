local buff = buff_define("铁卫_金刚不坏")
--每回合开始时，获得最大生命值10%的护盾

local shieldFactor = 0.1

function buff:OnRoundStart(args)
    local ownerId = self:GetBuffOwnerId(args)
    local shield = role_stat(ownerId, stat_key.MaxHp) * shieldFactor
    role_add_shield(ownerId, shield)
end

return buff
