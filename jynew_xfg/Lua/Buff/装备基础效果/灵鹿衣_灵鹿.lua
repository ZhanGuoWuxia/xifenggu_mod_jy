local buff = buff_define("灵鹿衣_灵鹿")
--每次受到伤害时，使周围队友获得15%最大气血值的护盾

local shieldFactor = 0.15

local function add_shield_to_role(role_id)
    if role_id then
        local maxHp = role_stat(role_id, stat_key.MaxHp)
        local shieldValue = maxHp * shieldFactor
        role_add_shield(role_id, shieldValue)
    end
end

function buff:OnDoHit(args)
    local ownerId = self:GetBuffOwnerId(args)

    local roles = {
        alive_role_of_up(ownerId),
        alive_role_of_down(ownerId),
        alive_role_of_front(ownerId),
        alive_role_of_back(ownerId)
    }

    for _, roleId in ipairs(roles) do
        add_shield_to_role(roleId)
    end
end

return buff