local buff = buff_define("削骨刀_剔骨")
local probability = 50

--每次攻击命中时，有50%概率对目标叠加1层<color=red>剔骨</color>（上限10层）
function buff:OnDoHit(args)
    if chance(probability) then
        for _, targetId in pairs(args.Targets) do
            add_buff("剔骨", targetId, args.AttackerId, 1, 5)
        end
    end
end

return buff
