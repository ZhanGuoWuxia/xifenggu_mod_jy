--每回合结束时，召唤一道落雷随机劈向一名敌人，造成一定量{{[stat:int] * 0.35}}内伤
local buff = buff_define("唤雷")

function buff:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)
    local enemyTeam = enemy_team_of_role(ownerId)
    local enemies = get_team_alive_roles(enemyTeam)

    local targetId = #enemies > 0 and table.pick_random(enemies) or nil
    if targetId then
        do_persue_skill(ownerId, "落雷", pos_of_role(targetId), enemyTeam)
    end
end

return buff