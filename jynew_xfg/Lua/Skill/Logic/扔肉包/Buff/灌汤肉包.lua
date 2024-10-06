local buff = buff_define("灌汤肉包")
--包子里额外灌了美味的肉汤,对生命值低于50%的队友额外提供他们已损失生命值10%点治疗

local hp_factor = 0.1

function buff:BeforeHealHp(args)

    if not args.RecoverResult:IsFromSkill("扔肉包") then
        return
    end

    local healedRoleId = args.RecoverResult.ReceiveRoleId
    if role_hp_percent_check(healedRoleId, "<", 0.5) then
        local additionHeal = math.floor(role_stat(healedRoleId, stat_key.MaxHp) * role_losed_hp_percent(healedRoleId) * hp_factor)
        args.RecoverResult.RecoverValue = args.RecoverResult.RecoverValue + additionHeal
    end
end

return buff
