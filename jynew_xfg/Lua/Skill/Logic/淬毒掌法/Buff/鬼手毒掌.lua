local buff = buff_define("鬼手毒掌")

--成功概率
local probability = 30

--对目标造成伤害时,有30%概率叠加1层[<color=purple>中毒</color>]效果,持续1回合
function buff:OnDoHit(args)
    if chance(probability) then
        for _, targetId in pairs(args.Targets) do
            add_buff("中毒", targetId, args.AttackerId, 1, 1)
        end
    end
end

return buff