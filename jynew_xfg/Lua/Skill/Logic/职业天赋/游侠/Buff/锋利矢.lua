local buff = buff_define("游侠_锋利矢")

--攻击造成暴击后，附加1层流血效果，持续3回合
function buff:OnDoCrit(args)
    for _, targetId in pairs(args.Targets) do
        add_buff("流血", targetId, args.AttackerId, 1, 5)
    end
end



return buff