local hunt_api = require("Common/hunt")
local function onHuntSuccess()

    add_player_item("冷牙的毒囊", 1)
    add_player_money(2500)
end

local function onHuntFail()
    
end

hunt_api.start_hunt(current_area, "冷牙", onHuntSuccess, onHuntFail)