local buff = buff_define("黑水仙_黑水仙之毒")
--每2回合令敌方全体单位身中黑水仙之毒，处于黑水仙之毒的目标受到中毒伤害时会加深50%

function buff:OnRoundStart(args)
    local ownerId = self:GetBuffOwnerId(args)
    if args.turn % 2 == 0 then
        local allies = get_team_alive_roles(enemy_team_of_role(ownerId))
        if #allies == 0 then
            return
        end
        add_buff_to_roles("黑水仙之毒", allies, ownerId, 1, 2)
    end
end

return buff