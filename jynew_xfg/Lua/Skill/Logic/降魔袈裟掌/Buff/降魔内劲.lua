local buff = buff_define("降魔内劲")

local function buff_chance(args)
    local prob = role_stat(buff_arg_owner(args), stat_key.InnerStrength) * 0.05
    return chance(prob)
end


function buff:OnDoHit(args)
    if not args.Skill:IsSkill("降魔掌") then
        return
    end
    if not buff_chance(args) then
        return
    end
    local attakerId = args.AttackerId
    local targets = args.Targets
    for _, defenderId in pairs(targets) do
        add_buff("降魔内伤", defenderId, attakerId)
    end
end

return buff