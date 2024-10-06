local diplomatic = require("Common/diplomatic")
local curRelation = diplomatic.current_relation("虎焰门", "万雀溪谷")
local player_menpai = get_player_menpai()
local medianLevel = player_menpai:MedianOfRoleLevel()

return curRelation == -1 or medianLevel >= 12 or get_game_round() >= 24
