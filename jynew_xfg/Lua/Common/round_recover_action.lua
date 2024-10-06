--大地图行动次数恢复逻辑

recover_action_count()

--恢复玩家门派角色的战斗上场次数
local player_roles = roles_of_menpai(get_player_menpai())
for i, role in pairs(player_roles) do
    role:ResetJoinBattleCount()
end
