local buff = buff_define("会心")

local PlusDamageRatio = 1
local probability = 15

--普通攻击有15%的概率造成2倍伤害
function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    if dmgInfo:IsSkillDamage() and dmgInfo:IsNormalAtk() and chance(probability) then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + PlusDamageRatio
        self:NotifyTriggered(args)
    end
end

return buff
