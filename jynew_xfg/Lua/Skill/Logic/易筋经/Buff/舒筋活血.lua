local buff = buff_define("舒筋活血")

local Ten2HpFactor = 0.01

function buff:OnRoundEnd(args)
    local ownerId = buff_arg_owner(args)
    local reHp = role_stat(ownerId, stat_key.Tenacity) * Ten2HpFactor
    do_buff_heal("舒筋活血", ownerId, ownerId, reHp)
end

return buff