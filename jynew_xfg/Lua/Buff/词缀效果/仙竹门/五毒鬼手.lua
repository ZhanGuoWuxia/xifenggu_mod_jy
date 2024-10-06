local buff = buff_define("五毒鬼手")

--对目标造成伤害后，若目标处于[中毒]状态，则延长1回合中毒
function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    local targetId = dmgInfo.TargetRoleId
    if role_has_buff(targetId, "中毒")  then
        change_buff_left_round(targetId, "中毒", 1)
    end
end

return buff