local buff = buff_define("重山护手_重山")
--当攻击被招架后，若对方防御低于自身且目标身后1格没单位时，将其击退一格

function buff:OnBeParried(args)
    local ownerId = self:GetBuffOwnerId(args)
    for _, targetId in pairs(args.Targets) do
        local col = col_of_role(targetId) + 1
        if role_stat(targetId, stat_key.Defense) < role_stat(ownerId, stat_key.Defense) and col < MAX_TEAM_COL then
            --判断角色后方是否有单位
            if roleid_at_pos(pos_of_role(targetId) + 1,  team_of_role(targetId)) == -1 then
                --将目标位置 调整至后方
                change_role_pos( targetId, pos_of_role(targetId) + 1)
            end
        end
    end
end

return buff