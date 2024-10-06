local hunt_api = require("Common/hunt")

local function get_goat_hunt_options()
    local options = {
        i18n_text("剥下羚羊皮以备后用"),
    }

    if has_flag("已解锁药店") then
        table.insert(options, i18n_text("带回去给[老郎中]"))
    end

    table.insert(options, i18n_text("拖回去烤了"))

    return options
end

local function onHuntSuccess()

    local idx = show_avg_select("齐六哥", "掌门，这些猎获的羚羊你打算如何处理", get_goat_hunt_options())
    switch(idx)
    {
        ["1"] = function()
            add_player_item("羚羊皮", 4)
        end,
        ["2"] = function()
            add_player_item("地羊丹", 2)
        end,
        ["3"] = function()
            add_player_item("肉排", 2)
        end,
    }
end

local function onHuntFail()

end

hunt_api.start_hunt(current_area, "羊", onHuntSuccess, onHuntFail)