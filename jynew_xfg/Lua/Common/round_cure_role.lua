--大地图角色恢复逻辑

local baseRecoverValue = current_difficult_param(DIFFICULT_PARAM_KEY.RoundRecoverStatus)
for _, role in pairs(runtime.CurrentSave.Roles) do
    if is_player_menpai(menpai_of_role(role)) then
        cure_wound(role, baseRecoverValue)
    else
        cure_wound(role, math.random(7, 12))
    end
end
