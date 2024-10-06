local buff = buff_define("血气护体")
--8回合之内，每次回复生命获得等量的护盾

local ReHpToShieldFactor = 1
local MaxAvailableTurn = 8

function buff:OnRecoverHp(args)
    if args.turn > MaxAvailableTurn then
        return
    end
    local ownerId = buff_arg_owner(args)
    local shieldNum = args.ReHp * ReHpToShieldFactor
    role_add_shield(ownerId, shieldNum)
end

return buff