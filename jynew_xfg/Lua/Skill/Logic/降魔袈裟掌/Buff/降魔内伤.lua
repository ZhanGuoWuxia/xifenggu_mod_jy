local buff = buff_define("降魔内伤")

--每过1回合随机失去一部分内力

function buff:OnThink(args)
    local CasterId = self:GetBuffLastCasterId(args)
    local ownerId = self:GetBuffOwnerId(args)
    local pile = self:GetBuffPile(args)
    local reduceMp = -math.floor(math.random_float(1, 1.5) * pile)
    self:TryDoBuffMpChange( args, CasterId, ownerId, reduceMp)
end

return buff
