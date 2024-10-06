local buff = buff_define("霸绝")

--使下次攻击附带8层[重创]，每层使恢复的气血下降10%
function buff:OnDoHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    for _, targetId in pairs(args.Targets) do
        add_buff("重创", targetId, ownerId, 8, 2)
    end
    remove_buff("霸绝", ownerId, ownerId)
end

return buff