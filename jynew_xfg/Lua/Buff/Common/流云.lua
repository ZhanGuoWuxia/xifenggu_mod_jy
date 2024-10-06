local buff = buff_define("流云")
--下次攻击追击1次普攻招式

function buff:AfterSkillCast(args)
    local ownerId = self:GetBuffOwnerId(args)
    do_persue_skill(ownerId, "", args.TargetParam.CastPosition , enemy_team_of_role(ownerId))
end

function buff:OnFinishSkillAttack(args)
    local ownerId = self:GetBuffOwnerId(args)
    if args.Skill.IsNormalAttack then
        remove_buff("流云", ownerId, ownerId)
    end
end

return buff