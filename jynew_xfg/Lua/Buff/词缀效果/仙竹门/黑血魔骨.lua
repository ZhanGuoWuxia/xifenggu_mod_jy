local buff = buff_define("黑血魔骨")
--每回合结束时，敌方每有1层减益状态则汲取1层黑血，每次汲取上限为20层。
--当拥有50层黑血时激活魔物，引动敌方全体单位的[中毒]状态，立即结算1次伤害，且引爆后中毒不会消失。
--同时根据所引动的总层数恢复自身气血值。

local damageFactor = 0.01
local recoverFactor = 0.01
local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType

--当回合结束时
function buff:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)
    local debuffPiles = 0
    local buffId = "黑血魔骨"
    local poisonRoles = {}
    --获取敌方存活角色列表
    local allies = get_team_alive_roles(enemy_team_of_role(ownerId))
    for i, roleId in pairs(allies) do
        debuffPiles = debuffPiles + get_role_debuffs_piles(roleId)
        --记录中毒单位，方便后续引爆伤害调用
        if role_has_buff(roleId, "中毒") then
            table.insert(poisonRoles, roleId)
        end
    end
    change_buff_pile(ownerId, buffId, math.min(debuffPiles,20))
    
    local isTrigger = false
    ---当拥有50层黑血时激活魔物，引动敌方全体单位的[中毒]状态，立即结算1次伤害
    if role_buff_pile(ownerId, buffId) >= 50 then
        for _, targetId in pairs(poisonRoles) do
            --引爆层数
            local detonateBuffPile = role_buff_pile(targetId, "中毒")
            local dmg = role_stat(targetId, stat_key.MaxHp) * damageFactor * detonateBuffPile * (1 + role_stat(targetId, stat_key.PoisonDamage))
            do_buff_damage(buffId, ownerId, targetId, dmg, DamageType.Poison)
            isTrigger = true
            --根据所引动的总层数恢复自身气血值
            local reHp = role_stat(ownerId, stat_key.MaxHp) * recoverFactor * detonateBuffPile
            self:TryDoBuffHeal(args, ownerId, ownerId, reHp)
        end
    end

    --如果触发了魔物 重置层数
    if isTrigger then
        tgr_api:tgr_bubble_text(ownerId, "复苏吧，黑血魔骨！")
        edit_buff_pile(ownerId, buffId, 1)
    end

end


return buff