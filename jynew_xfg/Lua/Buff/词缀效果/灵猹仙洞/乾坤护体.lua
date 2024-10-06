local buff = buff_define("乾坤护体")
--被暴击后，获得30%防御力的护盾

local CritType = CS.ZhanGuoWuxia.Backend.Battle.Data.CriticalRet

local shieldFactor = 0.3
function buff:AfterDefenderCrit(args)
    if args.CritRet == CritType.Crit then
        local ownerId = self:GetBuffOwnerId(args)
        local shield = role_stat(ownerId, stat_key.Defense) * shieldFactor
        role_add_shield(ownerId, shield)
    end
end

return buff