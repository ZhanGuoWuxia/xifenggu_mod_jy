--每回合结束时，随机获得[乾][坤][坎][离][震][艮][巽][兑]8种增益。(80%概率获得1种, 15%概率获得2种, 4%概率获得4种, 1%概率获得所有增益)
local buff = buff_define("白玉双鱼佩_祈福")
local BaGuaBuffs = {
    "乾",
    "坤",
    "坎",
    "离",
    "震",
    "艮",
    "巽",
    "兑"
}

local function next_reroll_buffs()
    local r = math.random(1, 100)
    if r <= 80 then
        return table.pick_random_many(BaGuaBuffs, 1)
    elseif r <= 95 then
        return table.pick_random_many(BaGuaBuffs, 2)
    elseif r <= 99 then
        return table.pick_random_many(BaGuaBuffs, 4)
    else
        return BaGuaBuffs
    end
end

function buff:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)
    local buffs = next_reroll_buffs()
    for _, buffId in pairs(buffs) do
        add_buff(buffId, ownerId, ownerId)
    end
end

return buff
