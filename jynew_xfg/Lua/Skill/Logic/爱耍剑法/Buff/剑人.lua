local buff = buff_define("剑人")

--当Buff携带者队友 攻击晕眩目标时，提升自身3%攻击力
function buff:OnAllyAttack(args)
    local targets = args.TargetParam.Targets
    for _, targetId in pairs(targets) do
        if role_has_buff(targetId, "晕眩") then
            local attackPercent = args.buff:GetStat(stat_key.AttackPercent)
            attackPercent = attackPercent + 0.03
            args.buff:SetStat(stat_key.AttackPercent, math.min(attackPercent, 1))
            break
        end
    end
end

--当Buff携带者队友暴击，提升自身3%攻击力
function buff:OnAllyDoCrit(args)
    local attackPercent = args.buff:GetStat(stat_key.AttackPercent)
    attackPercent = attackPercent + 0.03
    args.buff:SetStat(stat_key.AttackPercent, math.min(attackPercent, 1))
end

return buff