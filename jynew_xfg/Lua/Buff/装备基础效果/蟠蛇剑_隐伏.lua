local buff = buff_define("蟠蛇剑_隐伏")

--攻击命中敌方时，自身获得一层[蛇影], 提升一定闪避
function buff:OnDoHit(args)
    local OwnerId = self:GetBuffOwnerId(args)
    add_buff("蟠蛇剑_蛇影", OwnerId, OwnerId, 1, 2)
end

return buff
