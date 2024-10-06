local hunt_api = require("Common/hunt")
local function onHuntSuccess()

    add_player_item("守护兽的号角", 1)
    add_player_money(7500)
end

local function onHuntFail()

end

hunt_api.start_hunt(current_area, "咩咩", onHuntSuccess, onHuntFail)