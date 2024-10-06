local area = current_area
if not area then
    return
end

local diplomatic = require("Common/diplomatic")
local playerMenpai = get_player_menpai()
local targetMenpai = menpai_of_area(area)
local is_ok = yes_or_no(string.i18_format("是否对 {0} 宣战？", targetMenpai.Name))
if not is_ok then
    return
end
diplomatic.declare_war(playerMenpai, targetMenpai)
