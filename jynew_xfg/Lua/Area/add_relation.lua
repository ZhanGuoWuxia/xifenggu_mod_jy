local area = current_area
if not area then
    return
end

local targetMenpai = menpai_of_area(area)
local diplomatic = require("Common/diplomatic")
local playerMenpai = get_player_menpai()
local is_ok = yes_or_no(string.i18_format("是否与 {0} 缔结同盟？", targetMenpai.Name))
if not is_ok then
    return
end
diplomatic.make_ally(playerMenpai, targetMenpai)
