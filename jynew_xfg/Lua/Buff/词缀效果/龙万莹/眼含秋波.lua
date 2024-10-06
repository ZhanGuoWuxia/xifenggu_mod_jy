local buff = buff_define("眼含秋波")
--攻击命中后有20%概率会扰乱心智，使其[内息凌乱]一回合。

local function buff_chance(args)
    return chance(20)
end


function buff:OnDoHit(args)
    local attakerId = args.AttackerId
    local targets = args.Targets
    for _, defenderId in pairs(targets) do
        if buff_chance(args) then
            add_buff("内息凌乱", defenderId, attakerId,1,1)
        end
    end
end

return buff