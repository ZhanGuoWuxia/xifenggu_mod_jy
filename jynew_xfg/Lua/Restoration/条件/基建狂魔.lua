local player_menpai = get_player_menpai()
if not player_menpai then
    return false
end

local ConditionDevelop = 60
local ConditionArea = 6

local areas = table.where(areas_of_menpai(player_menpai), function(area)  return area.Develop >= ConditionDevelop end)
return #areas >= ConditionArea
