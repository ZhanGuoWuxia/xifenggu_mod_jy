local buff = buff_define("福运坠_福运")

--每次恢复气血时，有50%概率获得护盾(50%恢复气血值)
local ReHpToShieldFactor = 0.5
function buff:OnRecoverHp(args)
    if chance(50) then
        local ownerId = buff_arg_owner(args)
        local shieldNum = args.ReHp * ReHpToShieldFactor
        role_add_shield(ownerId, shieldNum)
    end
end

return buff