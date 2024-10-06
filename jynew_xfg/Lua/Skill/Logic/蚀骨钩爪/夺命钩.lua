local skill = skill_define("夺命钩")

function skill:OnCreate(args)
    add_buff("夺命钩监听", args.OwnerId)
end

function skill:OnDestroy(args)
    remove_buff("夺命钩监听", args.OwnerId)
end

function skill:GetSkillDamage(args)
    return role_stat(args.CasterId, stat_key.Attack) * 0.4
end

function skill:OnCast(args)
    self:TryDoSkillDamage(args)

    local targets = args.TargetParam.Targets
    for _, targetId in pairs(targets) do
        if _ == 0 then
            local colOfDefId = col_of_role(targetId) - 1
            local getEmPtyPos = get_empty_pos_col(colOfDefId, team_of_role(targetId))
            if getEmPtyPos ~= -1 then
                change_role_pos( targetId, getEmPtyPos)
            end
        end
    end
end

return skill