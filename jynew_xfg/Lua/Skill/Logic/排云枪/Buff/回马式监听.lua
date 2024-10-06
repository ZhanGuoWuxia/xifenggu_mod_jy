local buff = buff_define("回马式监听")

--(0.15*招架值)%几率
local function buff_chance(args)
    local prob = role_stat(buff_arg_owner(args), stat_key.Parry) * 0.15
    return chance(prob)
end

function buff:OnAllyBeAttacked(args)

    if not buff_chance(args) then
        return
    end
    local attakerId = args.AttackerId
    local OwnerId = self:GetBuffOwnerId(args)
    do_counter_skill(OwnerId, "回马式", pos_of_role(attakerId), team_of_role(attakerId))
end

return buff