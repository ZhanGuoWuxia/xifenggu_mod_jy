
local buff = buff_define("回首一棍监听")

--(0.1*招架值)%几率
local function buff_chance(args)
    local prob = role_stat(buff_arg_owner(args), stat_key.Parry) * 0.1
    return chance(prob)
end

--若触发招架
function buff:OnParry(args)
    if not buff_chance(args) then
        return
    end

    local OwnerId = self:GetBuffOwnerId(args)
    local attakerId = args.AttackerId
    add_buff("回首招架", OwnerId, OwnerId, 5, 2)
    
    --施展回首一棍进行反击对目标造成{{[stat:atk] * 0.8}}点外伤
    do_persue_skill(OwnerId, "回首一棍", pos_of_role(attakerId), team_of_role(attakerId))
end

return buff