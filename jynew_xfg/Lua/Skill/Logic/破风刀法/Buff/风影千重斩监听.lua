local buff = buff_define("风影千重斩监听")

--击败目标后，立即对敌方生命值最低的单位发起风影千重斩
function buff:OnKill(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local enemies = get_team_alive_roles(enemy_team_of_role(OwnerId))

    --判断下敌方还有没有存活的目标 以免报错
    if #enemies > 0  and args.DeathResult.ReasonSourceId=="破风式斩" then
        do_persue_skill(OwnerId, "风影千重斩", pos_of_role(get_team_lowest_hp_role(enemy_team_of_role(OwnerId))), enemy_team_of_role(OwnerId))
    end
end

return buff