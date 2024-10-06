local buff = buff_define("血影连斩")
--造成暴击后，若目标未死亡，则追击对其施展普攻[血饮击]

function buff:OnDoCrit(args)
    local target = args.TargetParam
    if target == nil then
        return
    end

    local ownerId = self:GetBuffOwnerId(args)
    do_persue_skill(ownerId, "", args.TargetParam.CastPosition, enemy_team_of_role(ownerId))
end

return buff