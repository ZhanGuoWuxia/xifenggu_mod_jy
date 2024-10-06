local buff = buff_define("蝶恋花")
local CritType = CS.ZhanGuoWuxia.Backend.Battle.Data.CriticalRet

function buff:AfterAttackerCrit(args)
    if args.CritRet == CritType.Crit then
        add_buff("蝶之舞", args.AttackerId, self:GetBuffOwnerId(args), 1)
    end
end

return buff