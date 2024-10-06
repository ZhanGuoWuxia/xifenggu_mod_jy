local buff = buff_define("淬毒掌影监听")

--依据角色速度属性,有{{[stat:spd] * 0.05}}%概率成功
local function buff_chance(args)
    local prob = role_stat(buff_arg_owner(args), stat_key.Speed) * 0.05
    return chance(prob)
end

--当Buff携带者的队友出手时，让Buff携带者对敌方执行追击技,造成{{[stat:int] * 0.7}}点内伤
function buff:OnAllyAttack(args)

    if not buff_chance(args) then
        return
    end

    local OwnerId = self:GetBuffOwnerId(args)
    do_persue_skill(OwnerId, "淬毒掌影", args.TargetParam.CastPosition, args.TargetParam.CastTeamSide)
end

return buff