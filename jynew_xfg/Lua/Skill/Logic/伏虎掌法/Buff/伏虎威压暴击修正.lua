local buff = buff_define("伏虎威压暴击修正")

function buff:BeforeAttackerCrit(args)
    if args.Skill:IsSkill("伏虎掌") then
        local attackerTen = role_stat(args.CritParam.AttackerId, stat_key.Tenacity)
        local defenderTen = role_stat(args.CritParam.DefenderId, stat_key.Tenacity)
        local fixCrit =  math.max(0, attackerTen - defenderTen)
        print("伏虎掌暴击修正:" .. fixCrit)
        args.CritParam.CritAddition = args.CritParam.CritAddition + fixCrit
    end
end

return buff