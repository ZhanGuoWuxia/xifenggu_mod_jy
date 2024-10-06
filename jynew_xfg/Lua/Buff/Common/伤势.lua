local buff = buff_define("伤势")
--每层被击时有10%概率[流血]

local pileTrigger = 10

function buff:OnHit(args)
    local pile = self:GetBuffPile(args)
    if chance(pile * pileTrigger) then
        add_buff("流血", self:GetBuffOwnerId(args), self:GetBuffOwnerId(args), 1, 2)
    end
end

return buff