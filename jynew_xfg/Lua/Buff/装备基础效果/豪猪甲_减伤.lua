local buff = buff_define("豪猪甲_减伤")
--受到减益状态目标的攻击时，目标每有1层减益状态，自身所受到的伤害降低3%，最多不超过50%

--当Buff携带者受到伤害前
function buff:BeforeReceiveDamage(args)
    local dmgInfo = args.DamageInfo
    --判断目标身上是否有减益状态
    if not role_has_debuff(dmgInfo.TargetRoleId) then
        return
    end
    --获取 目标所有减益状态所有层数
    local getDebuffsPiles = get_role_debuffs_piles(dmgInfo.TargetRoleId)
    dmgInfo.DamageRatio = dmgInfo.DamageRatio - math.min(getDebuffsPiles*0.03, 0.5)
end

return buff