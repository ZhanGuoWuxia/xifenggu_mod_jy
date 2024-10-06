local buff = buff_define("千足蜈蚣衣_千足封印")
--受到减益状态目标的攻击时，目标每有1层减益状态，则降低其1%攻击，持续2回合

--当Buff携带者受到伤害前
function buff:BeforeReceiveDamage(args)
    local dmgInfo = args.DamageInfo
    local targetRoleId = dmgInfo.AttackRoleId
    --判断目标身上是否有减益状态
    if role_has_debuff(targetRoleId) then
        --获取 目标所有减益状态所有层数
        local getDebuffsPiles = get_role_debuffs_piles(targetRoleId)
        if role_has_buff(targetRoleId, "毒蜈衰竭") then
            local getBuffStat = get_role_buff_stat(targetRoleId, "毒蜈衰竭", "atkper")
            set_role_buff_stat(targetRoleId, "毒蜈衰竭", "atkper", math.max(getDebuffsPiles * -0.01 + getBuffStat, -0.7))
        else
            add_buff("毒蜈衰竭", targetRoleId, buff_arg_owner(args), 1, 2)
            set_role_buff_stat(targetRoleId, "毒蜈衰竭", "atkper", math.max(getDebuffsPiles * -0.01 , -0.7))
        end
    end
    
end

return buff