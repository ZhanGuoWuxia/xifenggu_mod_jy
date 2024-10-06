local buff = buff_define("恐惧")
--回合结束后往空位乱跑

function buff:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)
    local emptyPositions = get_all_empty_pos(team_of_role(ownerId))
    local pos = -1

    if #emptyPositions > 0 then
        local randomIndex = math.random(1, #emptyPositions)
        pos = emptyPositions[randomIndex]
        tgr_api:tgr_bubble_text(ownerId, "好可怕")
        change_role_pos(ownerId, pos)
    end
end

return buff