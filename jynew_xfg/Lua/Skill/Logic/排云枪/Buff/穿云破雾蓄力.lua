local buff = buff_define("穿云破雾蓄力")

function buff:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)
    do_persue_skill(ownerId, "穿云破雾", TeamPos.Center, enemy_team_of_role(ownerId))
    remove_buff("穿云破雾蓄力", ownerId)
end

return buff