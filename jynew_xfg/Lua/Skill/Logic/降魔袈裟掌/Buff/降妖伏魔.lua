local buff = buff_define("降妖伏魔监听")

local function buff_chance(args)
    local prob = role_stat(buff_arg_owner(args), stat_key.Speed) * 0.05
    return chance(prob)
end


function buff:OnAllyAttack(args)
    if not buff_chance(args) then
        return
    end
    do_persue_skill(self:GetBuffOwnerId(args), "降妖伏魔", args.TargetParam.CastPosition, args.TargetParam.CastTeamSide)
end

return buff