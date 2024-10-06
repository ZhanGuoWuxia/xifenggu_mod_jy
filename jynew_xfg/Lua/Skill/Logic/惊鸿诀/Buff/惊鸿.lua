local buff = buff_define("惊鸿")

--暴击后移除
function buff:OnDoCrit(args)
    local ownerId = self:GetBuffOwnerId(args)
    remove_buff("惊鸿", ownerId, ownerId)
end

return buff