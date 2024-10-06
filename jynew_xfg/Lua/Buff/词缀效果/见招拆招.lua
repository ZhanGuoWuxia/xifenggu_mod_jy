local buff = buff_define("见招拆招")
local PlusDamageRatioPerParry = 0.04

--攻击目标时，目标每触发一次招架，自身下回合提升(4%*被招架次数)的伤害
function buff:OnBeParried(args)
    local parryCount = args.Targets.Count
    local OwnerId = self:GetBuffOwnerId(args)
    args.buff:SetFloat("提升的伤害百分比", PlusDamageRatioPerParry * parryCount)
    args.buff:SetInt("生效回合", args.turn + 1)
end

--计算伤害时加上提升伤害的比例
function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    local availableTurn = args.buff:GetInt("生效回合")
    local PlusDamageRatio = args.buff:GetFloat("提升的伤害百分比")
    if availableTurn == args.turn and PlusDamageRatio > 0 then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + PlusDamageRatio
        self:NotifyTriggered(args)
    end
end

function buff:OnRoundStart(args)
    --非生效回合就清除了
    local availableTurn = args.buff:GetInt("生效回合")
    if availableTurn ~= args.turn then
        args.buff:SetFloat("提升的伤害百分比", 0)
    end
end

return buff
