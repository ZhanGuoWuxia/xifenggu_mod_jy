--回合开始时， 根据场上[乾][坤][坎][离][震][艮][巽][兑]的种类数量，获得最多40%的伤害减免

local buff = buff_define("阵法师")


local BaguaBuffs = {"乾", "坤", "坎", "离", "震", "巽", "艮", "兑"}

local baseDamageReduceRate = 0.05

local function count_BaGuaBuffs(ownerId)
    local count = 0
    for i = 1, #BaguaBuffs do
        if role_has_buff(ownerId, BaguaBuffs[i]) then
            count = count + 1
        end
    end
    return count
end

function buff:OnRoundStart(args)
    local ownerId = self:GetBuffOwnerId(args)
    local buffCount = count_BaGuaBuffs(ownerId)

    local damageReduceRate = math.max(buffCount * baseDamageReduceRate, 0)
    args.buff:SetStat(stat_key.ReceiveDamageModifer, damageReduceRate)
end

return buff