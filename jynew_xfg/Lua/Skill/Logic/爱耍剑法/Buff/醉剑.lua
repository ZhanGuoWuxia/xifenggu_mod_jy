local buff = buff_define("醉剑")

--当Buff携带者队友 攻击晕眩目标时，将使用[普攻]连携追击目标
function buff:OnAllyAttack(args)
    local ownerId = self:GetBuffOwnerId(args)

    local targets = args.TargetParam.Targets
    for _, targetId in pairs(targets) do
        if role_has_buff(targetId, "晕眩") then
            do_persue_skill(ownerId, "", pos_of_role(targetId), team_of_role(targetId))
            break
        end
    end
end

return buff