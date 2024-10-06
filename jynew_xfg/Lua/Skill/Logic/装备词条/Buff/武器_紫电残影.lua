local buff = buff_define("武器_紫电残影")
local CritType = CS.ZhanGuoWuxia.Backend.Battle.Data.CriticalRet

function buff:AfterAttackerCrit(args)
    if args.CritRet == CritType.Crit then
        add_buff("紫电残影", args.AttackerId, self:GetBuffOwnerId(args), 1)
    end
end

function buff:BeforeAttackerCrit(args)
    local ownerId = self:GetBuffOwnerId(args)
    local defenderId = args.CritParam.DefenderId
    if role_speed_check(ownerId, ">", defenderId)  then
        args.CritParam.CritAddition = args.CritParam.CritAddition + 150
    end
end

return buff