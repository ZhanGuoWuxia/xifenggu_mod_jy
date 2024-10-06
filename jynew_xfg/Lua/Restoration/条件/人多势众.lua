local player_menpai = get_player_menpai()
if not player_menpai then
    return false
end
local roles = roles_of_menpai(player_menpai)
return roles.Count >= 30
