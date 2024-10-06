--自身每有任意[乾][坤][坎][离][震][艮][巽][兑] 一种增益，治疗效果提升10%, 最多提升80%。
local buff = buff_define("温泉师")

local BaguaBuffs = {"乾", "坤", "坎", "离", "震", "巽", "艮", "兑"}

local healPlusFactor = 0.1

local function count_BaGuaBuffs(ownerId)
    local count = 0
    for i = 1, #BaguaBuffs do
        if role_has_buff(ownerId, BaguaBuffs[i]) then
            count = count + 1
        end
    end
    return count
end

function buff:BeforeHealHp(args)
    local ownerId = self:GetBuffOwnerId(args)
    local healScale = count_BaGuaBuffs(ownerId) * healPlusFactor
    if healScale > 0 then
        args.RecoverResult.RecoverScale = args.RecoverResult.RecoverScale + healScale
    end
end

return buff