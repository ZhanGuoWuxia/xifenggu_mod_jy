local buff = buff_define("翎羽双箭监听")

local function buff_chance(args)
    local prob = 15
    return chance(prob)
end


function buff:OnAttack(args)
    if not args.Skill.IsNormalAttack then
        return
    end

    if not buff_chance() then
        return
    end

    local attakerId = args.AttackerId
    local OwnerId = self:GetBuffOwnerId(args)
    do_persue_skill(OwnerId, "翎羽双箭", args.TargetParam.CastPosition, team_of_role(attakerId))
end

return buff