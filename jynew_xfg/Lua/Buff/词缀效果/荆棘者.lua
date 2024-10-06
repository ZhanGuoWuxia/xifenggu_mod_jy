local buff = buff_define("荆棘者")
--对减益状态目标造成伤害后，附加10层易伤状态

function buff:OnDoHit(args)
    for _, targetId in pairs(args.Targets) do
        if role_has_debuff(targetId) then
            add_buff("易伤", targetId, args.AttackerId, 10, 2)
        end
    end
end

return buff