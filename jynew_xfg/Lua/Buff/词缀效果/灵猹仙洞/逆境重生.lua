local buff = buff_define("逆境重生")
--被击后，若存在护盾，恢复5%最大气血值

function buff:OnHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    if role_shield_check(ownerId, ">", 0) then
        local reHp = role_stat(ownerId, stat_key.MaxHp) * 0.05
        do_buff_heal("逆境重生", ownerId, ownerId, reHp)
    end
end

return buff