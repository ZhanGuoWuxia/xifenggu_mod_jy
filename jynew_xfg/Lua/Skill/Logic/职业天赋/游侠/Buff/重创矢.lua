local buff = buff_define("游侠_重创矢")

--对目标造成伤害后会附加1层重创效果，持续3回合
function buff:OnDoHit(args)
    for _, targetId in pairs(args.Targets) do
        add_buff("重创", targetId, args.AttackerId, 1, 3)
    end
end

return buff