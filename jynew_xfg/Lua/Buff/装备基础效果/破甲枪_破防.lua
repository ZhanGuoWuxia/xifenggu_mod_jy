local buff = buff_define("破甲枪_破防")
--对晕眩目标造成伤害后有30%概率附加[破甲]状态,减少50%防御

function buff:OnDoHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    for _, targetId in pairs(args.Targets) do
        if role_has_buff(targetId, "晕眩") and chance(30) then
            add_buff("破甲", targetId, ownerId, 1 , 2)
        end
    end
end

return buff