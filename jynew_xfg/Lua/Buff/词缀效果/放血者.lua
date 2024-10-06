local buff = buff_define("放血者")
local probability = 50

--每次攻击命中时，有50%概率对目标叠加1层<color=red>流血</color>（上限10层）
function buff:OnDoHit(args)
    if chance(probability) then
        for _, targetId in pairs(args.Targets) do
            add_buff("流血", targetId, args.AttackerId, 1, 3)
        end
    end
end

return buff
