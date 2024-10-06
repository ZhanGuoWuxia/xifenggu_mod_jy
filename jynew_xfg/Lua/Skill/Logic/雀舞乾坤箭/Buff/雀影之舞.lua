local buff = buff_define("雀影之舞")

--施展[雀翎风暴]后，每命中1名敌人，自身提升5%攻击力，持续1回合
function buff:AfterSkillCast(args)
    if not args.Skill:IsSkill("雀翎风暴") then 
        return
    end

    local count = args.TargetParam.Targets.Count
    add_buff("攻击提升", args.CasterId, args.CasterId, count * 5, 1)
    
end

return buff