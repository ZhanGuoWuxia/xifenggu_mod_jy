local buff = buff_define("自私自利")
--每回合结束时，将自身所有的减益状态转移给队友

function buff:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)

    if role_has_debuff(ownerId) then
        local transferRoleId = -1
        --随机获取存活的队友，优先T
        local aliveRoles = get_alive_teammates(ownerId)
        for i, roleId in pairs(aliveRoles) do
            if get_role_classId(roleId) == "铁卫" then
                transferRoleId = roleId
            end
        end
        if transferRoleId == -1 then
            if #aliveRoles > 0 then
                local randomIndex = math.random(1, #aliveRoles)
                transferRoleId = aliveRoles[randomIndex]
            end
        end

        local RoleDebuffs = get_role_all_debuffs(ownerId)
        for _, buff in pairs(RoleDebuffs) do
            add_buff(buff.BuffId, transferRoleId, buff.LastCasterId, buff.Pile, buff.LeftRound)
            remove_buff(buff.BuffId, ownerId, ownerId)
        end
    end
end

return buff