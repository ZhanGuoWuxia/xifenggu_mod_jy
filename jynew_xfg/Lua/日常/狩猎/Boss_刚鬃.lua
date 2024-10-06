local hunt_api = require("Common/hunt")
local function onHuntSuccess()

    add_player_item("刚鬃的坚定", 1)
    add_player_money(2500)
end

local function onHuntFail()

end

hunt_api.start_hunt(current_area, "刚鬃", onHuntSuccess, onHuntFail)