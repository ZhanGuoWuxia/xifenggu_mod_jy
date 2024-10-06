local hunt_api = require("Common/hunt")

local function get_snake_hunt_options()
    local options = {
        i18n_text("留下蛇胆以备后用"),
    }

    if has_flag("已解锁药店") then
        table.insert(options, i18n_text("带回去交给老神医"))
    end

    if player_menpai_has_role("汤彩蝶") then
        table.insert(options, i18n_text("带回去交给汤彩蝶"))
    end

    return options
end

local function onHuntSuccess()

    local idx = show_avg_select("齐六哥", "掌门，这些猎获的蛇你打算如何处理", get_snake_hunt_options())
    switch(idx)
    {
        ["1"] = function()
            add_player_item("蛇胆", 4)
        end,
        ["2"] = function()
            add_player_item("蛇胆解毒丸", 3)
        end,
        ["3"] = function()
            add_player_item("影蛇丹", 3)
        end,
    }
end

local function onHuntFail()

end

hunt_api.start_hunt(current_area, "蛇", onHuntSuccess, onHuntFail)