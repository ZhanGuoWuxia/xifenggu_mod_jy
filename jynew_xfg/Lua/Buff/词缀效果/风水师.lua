--回合开始时，随机为一名队友进行占卜，使其有各有50%的概况获得【凶】【吉】，友方身上每有[乾][坤][坎][离][震][艮][巽][兑]中的一种增益，偏向【吉】的权重提升5%。
--【凶】：1回合内受到伤害提升50%。
--【吉】：1回合内受到伤害降低50%。
local buff = buff_define("风水师")

local BaguaBuffs = {"乾", "坤", "坎", "离", "震", "巽", "艮", "兑"}

local baseLuckChance = 50
local additionChance = 5

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
    local allies = get_alive_teammates(ownerId)

    local targetId = #allies > 0 and table.pick_random(allies) or ownerId
    local buffCount = count_BaGuaBuffs(ownerId)
    local prob = baseLuckChance + additionChance * buffCount

    if chance(prob) then
        add_buff("风水师_吉", targetId, ownerId, 1)
    else
        add_buff("风水师_凶", targetId, ownerId, 1)
    end
end

return buff