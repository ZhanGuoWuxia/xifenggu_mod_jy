local buff = buff_define("流云剑_流云")
--攻击时有30%几率触发[流云]效果，使下次攻击追击1次普攻招式

local probability = 30

function buff:OnDoHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    if chance(probability) then
        add_buff("流云", ownerId, ownerId, 1, 2)
    end
end

return buff