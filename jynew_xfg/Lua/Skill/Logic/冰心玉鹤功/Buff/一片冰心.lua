local buff = buff_define("一片冰心")

--每当成功闪避敌人的攻击时，清除1层减益状态
function buff:OnDodge(args)
    local ownerId = self:GetBuffOwnerId(args)
    dispel_random_debuffs(ownerId, ownerId, 1)
end

return buff