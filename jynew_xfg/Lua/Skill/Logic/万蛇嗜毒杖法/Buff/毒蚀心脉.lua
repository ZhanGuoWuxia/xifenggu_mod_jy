local buff = buff_define("毒蚀心脉")

--造成伤害后
function buff:OnDoHit(args)
    local OwnerId = self:GetBuffOwnerId(args)
    for _, targetId in pairs(args.Targets) do
        if role_buff_pile(targetId, "中毒") >= 10 then
            add_buff("毒蚀", targetId, OwnerId, 1 , 2)
        end
    end
end

return buff