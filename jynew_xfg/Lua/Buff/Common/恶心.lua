local buff = buff_define("恶心")

local CritType = CS.ZhanGuoWuxia.Backend.Battle.Data.CriticalRet
local pileTrigger = 10

--被暴击时有概率会晕眩(每层10%)
function buff:AfterDefenderCrit(args)
    local pile = self:GetBuffPile(args)
    if args.CritRet == CritType.Crit and chance(pile * pileTrigger) then
        add_buff("晕眩", self:GetBuffOwnerId(args), self:GetBuffOwnerId(args), 1, 2)
    end
end

return buff