local buff = buff_define("穿甲霜魄")

--攻击时有{{[stat:int] * 0.1}}%概率附加破甲效果
local function buff_chance(args)
    local prob = role_stat(buff_arg_owner(args), stat_key.InnerStrength) * 0.1
    return chance(prob)
end



function buff:OnDoHit(args)
    if not buff_chance(args) then
        return
    end

    for _, targetId in pairs(args.Targets) do
        add_buff("破甲", targetId, args.AttackerId, 1, 2)
    end

end

return buff