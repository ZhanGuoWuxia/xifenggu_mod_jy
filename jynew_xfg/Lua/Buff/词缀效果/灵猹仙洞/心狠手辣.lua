local buff = buff_define("心狠手辣")
--暴击后有50%概率使敌人陷入恐惧状态（回合结束后往空位乱跑）

local CritType = CS.ZhanGuoWuxia.Backend.Battle.Data.CriticalRet
function buff:AfterAttackerCrit(args)
    if args.CritRet == CritType.Crit and chance(50) then
        add_buff("恐惧", args.DefenderId, self:GetBuffOwnerId(args), 1, 1)
    end
end

return buff