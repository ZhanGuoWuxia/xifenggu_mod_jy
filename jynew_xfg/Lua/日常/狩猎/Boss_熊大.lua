local hunt_api = require("Common/hunt")
local function onHuntSuccess()

    add_player_item("巨熊之握", 1)
    add_player_money(5000)
end

local function onHuntFail()

end

hunt_api.start_hunt(current_area, "熊大", onHuntSuccess, onHuntFail)