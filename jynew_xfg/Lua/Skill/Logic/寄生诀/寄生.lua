local skill = skill_define("寄生")
--令目标减益状态的层数×2，但持续时间减少1回合


function skill:OnCast(args)
    local targets = args.TargetParam.Targets
    local additionalTargets = {}

    --寄生令目标同一行的单位也起作用
    if role_has_buff(args.CasterId, "寄生蔓延") then
        for _, targetId in pairs(targets) do
            local rolesInSameRow = get_roles_in_same_row(targetId)
            if #rolesInSameRow > 0 then
                additionalTargets = rolesInSameRow
            end
        end
        args.TargetParam.CastPosition = pos_of_role(args.CasterId)
        args.TargetParam:ClearTargets()
        for _, targetId in pairs(additionalTargets) do
            args.TargetParam:AddTarget(targetId)
        end
    end

    for _, targetId in pairs(targets) do
        local role = get_battle_role(targetId)
        if not role then
            return
        end
        for _, buff in pairs(role.Buffs) do
            if not buff.IsPositive and not buff.IsSpecial then
                buff.Pile = buff.Pile * 2
                buff.LeftRound = buff.LeftRound - 1
            end
        end
    end

end

return skill