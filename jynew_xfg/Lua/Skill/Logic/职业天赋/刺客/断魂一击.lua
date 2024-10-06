local skill = skill_define("刺客_断魂一击")
--向敌方生命值最低的单位发起攻击，对其造成{{[stat:atk] * 1}}外伤

function skill:OnCast(args)
    self:TryDoSkillDamage(args)
end

function skill:GetSkillDamage(args)
    return role_stat(args.CasterId, stat_key.Attack) * 1
end

function skill:OnModifyTarget(args)
    local TargetParam = args.TargetParam

    local enemies = get_team_alive_roles(enemy_team_of_role(args.CasterId))

    if #enemies > 0 then
        local targetId = get_team_lowest_hp_role(enemy_team_of_role(args.CasterId))
        TargetParam.CastPosition = pos_of_role(targetId)
        TargetParam:ClearTargets()
        TargetParam:AddTarget(targetId)
        return true
    end
    return false
end

return skill