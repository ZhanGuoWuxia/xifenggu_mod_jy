local diplomatic = require("Common/diplomatic")
local curRelation = diplomatic.current_relation("虎焰门", "龙湾门")
return curRelation == -1 or get_game_round() >= 14
