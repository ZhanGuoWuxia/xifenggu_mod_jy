local buff = buff_define("血影重重")

local function buff_chance(args)
    local prob = role_stat(buff_arg_owner(args), stat_key.Crit) * 0.05
    return chance(prob)
end


function buff:OnDoHit(args)
    if not args.Skill:IsSkill("无影剑") then
        return
    end
    if not buff_chance(args) then
        return
    end
    local attakerId = args.AttackerId
    local targets = args.Targets
    for _, defenderId in pairs(targets) do
        add_buff("流血", defenderId, attakerId, 1, 3)
    end
end

return buff