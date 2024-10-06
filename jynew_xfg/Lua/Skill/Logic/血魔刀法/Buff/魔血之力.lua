local buff = buff_define("魔血之力")

local BuffPileToChange = 7

function buff:BeforeSkillCast(args)
    if not args.Skill:IsSkill("血煞斩空") then
        return
    end
    local CasterId = args.CasterId
    if role_buff_pile(CasterId, "嗜血") >= BuffPileToChange then
        args.TargetParam:SetNewTargets(get_alive_enemies_of_role(CasterId))
        set_role_buff_int(CasterId, "嗜血", "激活血煞斩空全屏", 1)
    end
end

function buff:OnFinishSkillAttack(args)
    if not args.Skill:IsSkill("嗜血魔刀") and not args.Skill:IsSkill("血煞斩空") then
        return
    end
    local AttackerId = args.AttackerId
    add_buff("嗜血", AttackerId, AttackerId, 4)
    if get_role_buff_int(AttackerId, "嗜血", "激活血煞斩空全屏") == 1 then
        remove_buff("嗜血", AttackerId)
    end
end

return buff