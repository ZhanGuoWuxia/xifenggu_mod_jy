local buff = buff_define("游侠_支援")
--有几率在己方队友出手时发动连携攻击

local function buff_chance(args)
    local prob = role_stat(buff_arg_owner(args), stat_key.Speed) * 0.05
    return chance(prob)
end


function buff:OnAllyAttack(args)
    if not buff_chance(args) then
        return
    end
    local OwnerId = self:GetBuffOwnerId(args)
    --以当前角色普通攻击追击
    do_persue_skill(OwnerId, "", args.TargetParam.CastPosition, args.TargetParam.CastTeamSide)
end

return buff