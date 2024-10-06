local buff = buff_define("水龙戒_潜影")
--成功闪避攻击后，获得[潜袭],使自身下次普通攻击伤害提升

function buff:OnDodge(args)
    local ownerId = self:GetBuffOwnerId(args)
    add_buff("水龙戒_潜袭", ownerId, ownerId)
end

return buff