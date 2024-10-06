local buff = buff_define("苍狼逐月")

--当友方攻击时,有{{[stat:parry] * 0.1}}%的概率连携追击敌人，造成{{[stat:atk] * 0.75}}点外伤。
local function buff_chance(args)
    local prob = role_stat(buff_arg_owner(args), stat_key.Parry) * 0.1
    return chance(prob)
end

function buff:OnAllyAttack(args)

    if not buff_chance(args) then
        return
    end
    local attakerId = args.AttackerId
    local OwnerId = self:GetBuffOwnerId(args)
    do_persue_skill(OwnerId, "苍狼逐月",  args.TargetParam.CastPosition, args.TargetParam.CastTeamSide)
end

return buff