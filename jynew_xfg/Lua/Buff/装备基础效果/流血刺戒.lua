local buff = buff_define("流血刺戒")

--附加的BUFF ID
local BuffId = "流血"

--每次对流血目标造成伤害后，再附加1层流血状态
function buff:OnDoHit(args)
    for _, targetId in pairs(args.Targets) do
        if role_buff_pile(targetId, BuffId) > 0 then
            add_buff("流血", targetId, args.AttackerId, 1, 2)
        end
    end
end

return buff