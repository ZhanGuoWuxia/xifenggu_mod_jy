local buff = buff_define("影御敌")
--每命中1个持有减益状态目标时，提升2%招架率（上限20%）

local addParry = 20
local parryMax = 200
function buff:OnDoHit(args)
    local parry = args.buff:GetStat(stat_key.Parry)
    for _, targetId in pairs(args.Targets) do
        --判断目标身上是否有减益状态
        if role_has_debuff(targetId) then
            parry = parry + addParry
        end
    end
    if parry > 0 then
        args.buff:SetStat(stat_key.Parry, math.min(parry, parryMax))
    end
end

return buff