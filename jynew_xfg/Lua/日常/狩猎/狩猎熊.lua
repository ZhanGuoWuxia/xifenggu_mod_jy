local hunt_api = require("Common/hunt")


local function get_bear_hunt_options()
    local options = {
        i18n_text("留下熊掌以备后用"),
    }

    if has_flag("已解锁药店") then
        table.insert(options, i18n_text("带回去交给[老郎中]"))
    end

    if player_menpai_has_role("朱三娘") then
        table.insert(options, i18n_text("带回去交给[三娘]红烧"))
    end

    return options
end

local function onHuntSuccess()

    local idx = show_avg_select("齐六哥", "掌门，这些猎获的大熊你打算如何处理", get_bear_hunt_options())
    switch(idx)
    {
        ["1"] = function()
            add_player_item("熊掌", 5)
        end,
        ["2"] = function()
            add_player_item("熊骨丹", 1)
        end,
        ["3"] = function()
            add_player_item("红烧熊掌", 2)
        end,
    }
end

local function onHuntFail()

end

hunt_api.start_hunt(current_area, "熊", onHuntSuccess, onHuntFail)