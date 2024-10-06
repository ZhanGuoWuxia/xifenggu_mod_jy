local buff = buff_define("疯不所知")
--不再固定攻击面前敌人，而改成不管对方站位，全场随机攻击一个敌人

function buff:BeforeSkillCast(args)
    if not args.Skill:IsSkill("疯魔一击") then
        return
    end
    local roleId = get_team_random_role(args.TargetParam.CastTeamSide)
    if roleId then
        args.TargetParam.CastPosition = pos_of_role(roleId)
        args.TargetParam:ClearTargets()
        args.TargetParam:AddTarget(roleId)
    end
end

return buff