local buff = buff_define("银剑")

--当Buff携带者队友暴击
function buff:OnAllyDoCrit(args)
    local ownerId = self:GetBuffOwnerId(args)
    --以当前角色普通攻击追击
    do_persue_skill(ownerId, "", args.TargetParam.CastPosition, args.TargetParam.CastTeamSide)
end

return buff