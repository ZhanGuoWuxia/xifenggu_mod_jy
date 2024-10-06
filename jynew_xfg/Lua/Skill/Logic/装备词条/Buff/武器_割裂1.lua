local buff = buff_define("武器_割裂1")

local function buff_chance(args)
    local prob = 30
    return chance(prob)
end


function buff:OnDoHit(args)
    if not buff_chance(args) then
        return
    end
    local attakerId = args.AttackerId
    local targets = args.Targets
    for _, defenderId in pairs(targets) do
        add_buff("流血", defenderId, attakerId,1,2)
    end
end

return buff