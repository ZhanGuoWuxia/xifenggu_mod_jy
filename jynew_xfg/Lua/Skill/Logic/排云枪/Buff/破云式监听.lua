local buff = buff_define("破云式监听")

local function buff_chance(args)
    local prob = role_stat(buff_arg_owner(args), stat_key.Attack) * 0.01
    return chance(prob)
end


function buff:OnDoHit(args)
    if not args.Skill:IsSkill("梨花式") then
        return
    end
    if not buff_chance(args) then
        return
    end
    local attakerId = args.AttackerId
    local targets = args.Targets
    for _, defenderId in pairs(targets) do
        add_buff("破甲", defenderId, attakerId, 1, 3)
    end
end

return buff