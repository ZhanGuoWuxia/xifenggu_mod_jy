local skill = skill_define("影穿云")
--对目标及其身后1格单位造成{{[stat:atk] * 0.7}}点外伤，并暴露身后单位的[伤势]，被击时有（5*武学等级）%概率[流血]

function skill:GetSkillDamage(args)
    return role_stat(args.CasterId, stat_key.Attack) * 0.7
end

function skill:OnCast(args)
    self:TryDoSkillDamage(args)
    local backRolePos = -1
    local backRoleId = -1
    local targets = args.TargetParam.Targets
    for _, targetId in pairs(targets) do
        if pos_of_role(targetId) > backRolePos then
            backRolePos = pos_of_role(targetId)
            backRoleId = targetId
        end
    end
    if targets.Count > 1 and backRolePos ~= -1 then
        add_buff("伤势", backRoleId, args.CasterId, 4, 2)
    end
end

return skill