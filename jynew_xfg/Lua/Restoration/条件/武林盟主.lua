local player_menpai = get_player_menpai()
if not player_menpai then
    return false
end

local ConditionArea = 30
local areas = areas_of_menpai(player_menpai)
return #areas >= ConditionArea
