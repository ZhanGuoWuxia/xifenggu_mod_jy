local buff = buff_define("疯魔拳法暴击修正")

function buff:BeforeAttackerCrit(args)
    if args.Skill:IsSkill("疯魔乱拳") then
        args.CritParam.CritScale = args.CritParam.CritScale / 5
    end
end

return buff