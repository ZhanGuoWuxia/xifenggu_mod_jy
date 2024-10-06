local buff = buff_define("更多肉包")
--扔肉包额外再治疗一名受伤的队友

function buff:BeforeSkillCast(args)

    if not args.Skill:IsSkill("扔肉包") then
        return
    end
    local TargetParam = args.TargetParam
    local OwnerId = self:GetBuffOwnerId(args)
    local hurt_allies = get_team_hurt_roles(team_of_role(OwnerId))
    --过滤掉已经是技能目标的单位
    for i = #hurt_allies, 1, -1 do
        if TargetParam:HasTarget(hurt_allies[i]) then
            table.remove(hurt_allies, i)
            break
        end
    end
    --如果还有其他单位就补加
    if #hurt_allies > 0 then
        TargetParam:AddTarget(table.pick_random(hurt_allies))
    end
end

return buff