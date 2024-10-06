--对目标造成{{[stat:atk] * 0.75}}点外伤，
--每拥有1层任意八卦增益，此伤害提升<color=#00da2e>3%</color>。攻击后移除自身所有的[乾][坤][坎][离][震][艮][巽][兑]。
local skill = skill_define("阴阳一击")
local BaguaBuffs = {"乾","坤","坎","离","震","艮","巽","兑"}

local dmgScale = 0.75
local dmgMultiplier = 0.03

local function remove_all_baguaBuffs(casterId)
    for _, buffId in pairs(BaguaBuffs) do
        remove_buff(buffId, casterId)
    end
end

function skill:GetSkillDamage(args)
    local buffCnt = 0
    for _, buffId in pairs(BaguaBuffs) do
        buffCnt = buffCnt + role_buff_pile(args.CasterId, buffId)
    end
    local dmg =  role_stat(args.CasterId, stat_key.Attack) * dmgScale * (1 + buffCnt * dmgMultiplier)
    return dmg
end

function skill:OnCast(args)
    self:TryDoSkillDamage(args)
    remove_all_baguaBuffs(args.CasterId)
end

return skill