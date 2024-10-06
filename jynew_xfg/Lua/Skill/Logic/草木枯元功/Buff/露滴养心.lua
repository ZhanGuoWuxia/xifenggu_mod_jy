local buff = buff_define("露滴养心")
--每回合结束后，根据场上敌方所有目标的减益状态数量和层数恢复自身气血值，最多恢复30%


--回合结束后
function buff:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)
    --获取敌方队伍存活角色列表
    local enemies = get_team_alive_roles(enemy_team_of_role(ownerId))
    local cnt = 0

    --获取目标的减益状态数量和层数
    for i, roleId in pairs(enemies) do
        cnt = cnt + get_role_debuffs_piles(roleId)
    end
    if cnt > 0 then
        --恢复自身气血值，每层3%，最多恢复30%
        local reHp = role_stat(ownerId, stat_key.MaxHp) * math.min(0.3, cnt * 0.03)
        self:TryDoBuffHeal(args, ownerId, ownerId, reHp)
    end
end

return buff