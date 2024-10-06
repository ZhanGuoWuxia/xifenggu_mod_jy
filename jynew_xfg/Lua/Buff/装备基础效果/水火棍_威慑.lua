--攻击命中敌人后，有30%概率削弱目标攻击和暴击，并获得一层[坎]或者[离]
local buff = buff_define("水火棍_威慑")
local buff_chance = 30

function buff:OnDoHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    local targets = args.Targets
    for _, defenderId in pairs(targets) do
        if chance(buff_chance) then
            add_buff("水火棍_威慑削弱", defenderId, ownerId)
        end
    end

    if chance(50) then
        add_buff("坎", ownerId, ownerId)
    else
        add_buff("离", ownerId, ownerId)
    end

end

return buff