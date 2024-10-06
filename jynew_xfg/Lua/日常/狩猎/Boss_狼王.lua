local hunt_api = require("Common/hunt")
local function onHuntSuccess()

    add_player_item("苍狼冥月枪", 1)
    add_player_money(10000)
end

local function onHuntFail()

end

hunt_api.start_hunt(current_area, "狼王", onHuntSuccess, onHuntFail)