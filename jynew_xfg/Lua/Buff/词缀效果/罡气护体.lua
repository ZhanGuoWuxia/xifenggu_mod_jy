--每回合开始时，获得最大生命值5%的护盾
local buff = buff_define("罡气护体")

local shieldFactor = 0.05

function buff:OnRoundStart(args)
    local ownerId = self:GetBuffOwnerId(args)
    local shield = role_stat(ownerId, stat_key.MaxHp) * shieldFactor
    role_add_shield(ownerId, shield)
end

return buff
