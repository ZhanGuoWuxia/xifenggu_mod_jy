--被敌方攻击命中时进行判定，自身每有[乾][坤][坎][离][震][艮][巽][兑]8种增益的一种，当前判定的闪避值提升1.1倍数，最多可提升8次方

local buff = buff_define("八卦衣_八卦阵")
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
local baseScaleFactor = 1.1

function buff:BeforeDefenderHit(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local cnt = 0
    for _, buffId in pairs(BaGuaBuffs) do
        if role_has_buff(OwnerId, buffId) then
            cnt = cnt + 1
        end
    end
    if cnt == 0 then
        return
    end
    args.HitParam.DodgeScale = args.HitParam.DodgeScale * (baseScaleFactor ^ cnt)
end

return buff