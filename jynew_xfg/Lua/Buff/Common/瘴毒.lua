local buff = buff_define("瘴毒")
--每次恢复气血时 中毒1层，2回合

function buff:OnRecoverHp(args)
    local ownerId = self:GetBuffOwnerId(args)
    local CasterId = self:GetBuffLastCasterId(args)
    add_buff("中毒", ownerId, CasterId, 1, 2)
end

return buff