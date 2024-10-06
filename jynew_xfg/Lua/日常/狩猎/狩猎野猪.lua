local hunt_api = require("Common/hunt")


local function get_bear_hunt_options()
    local options = {
        i18n_text("拔掉它们的牙就行"),
        i18n_text("卖给当地屠户"),
    }

    if has_flag("已解锁药店") then
        table.insert(options, i18n_text("带回去交给[老郎中]"))
    end

    return options
end

local function onHuntSuccess()

    local idx = show_avg_select("齐六哥", "掌门，这些猎获的野猪你打算如何处理", get_bear_hunt_options())
    switch(idx)
    {
        ["1"] = function()
            add_player_item("野猪牙", 4)
        end,
        ["2"] = function()
            add_player_money(1000)
        end,
        ["3"] = function()
            add_player_item("豚牙丹", 3)
        end,
    }
end

local function onHuntFail()

end

hunt_api.start_hunt(current_area, "野猪", onHuntSuccess, onHuntFail)