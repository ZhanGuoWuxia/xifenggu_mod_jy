local hunt_api = require("Common/hunt")

local function get_wolf_hunt_options()
    local options = {
        i18n_text("直接卖给当地猎户"),
    }

    if has_flag("已解锁药店") then
        table.insert(options, i18n_text("带回去给[老神医]"))
    end

    if player_menpai_has_role("秋") then
        table.insert(options, i18n_text("带回去给[秋]"))
    end

    return options
end

local huntArea = current_area
local function onHuntSuccess()

    avg_talk("齐六哥", "此地的狼患缓解了不少")
    change_area_develop(huntArea, 2)

    local idx = show_avg_select("齐六哥", "掌门，这些野狼你打算如何处理", get_wolf_hunt_options())
    switch(idx)
    {
        ["1"] = function()
            add_player_money(1000)
        end,
        ["2"] = function()
            add_player_item("苍狼丹", 2)
        end,

        ["3"] = function()
            add_player_item("狼牙", 4)
        end,
    }

end

local function onHuntFail()

end

hunt_api.start_hunt(huntArea, "狼", onHuntSuccess, onHuntFail)