local player_menpai = get_player_menpai()
if not player_menpai then
    return false
end
local roles = roles_of_menpai(player_menpai)
local maxLevelRoles = table.where(roles, function(r) return r:IsLevelMax() end)
return #maxLevelRoles >= 6
