avg_talk("", "山势高耸，云雾缭绕，崖壁上有一截锁链悬挂在半空中。")

if has_flag("完成山顶") then
    return
end

local options = {
    "顺着锁链爬下去（轻功>10）",
    "离开",
}

local idx = show_quick_selections(options)
switch(idx) {
    ["1"] = function()
        local stat = role_attr("司徒来也", stat_key.qinggong)
        if stat > 10 then
            avg_talk("司徒来也", "这悬崖倒也不算太陡峭，不如用轻功下去探探情况。")
            avg_talk("", "山下是一片平原，远处有一座寨子。")
            set_flag("完成山顶")
        else
            avg_talk("司徒来也", "这锁链锈迹斑斑，实在不怎么结实，贸然前行怕是有些危险……")
            local ops = {
                "强行爬下去",
                "离开",
            }
            local i = show_quick_selections(ops)
            switch(i) {
                ["1"] = function()
                    avg_talk("", "(player:fullname)勉强沿锁链爬下山崖，却不想锁链断开，重重摔下。")
                    role_add_affix("司徒来也", "摔断腿")
                    pop_tip(string.i18_format("(player:fullname)获得了{0}", affix_tip_link("摔断腿", "摔断腿", "#00DA2E")))
                    avg_talk("司徒来也", "略微行动便疼得厉害，别是摔断腿了。")
                    avg_talk("", "山下是一片平原，远处有一座寨子。")
                    set_flag("完成山顶")
                end,
                ["2"] = function()
                    return
                end
            }
        end
    end,
    ["2"] = function()
        return
    end
}