avg_talk("", "幽暗的石洞中蛛网遍布，在这种地方，是何人放置了一个玄铁宝箱？")

if has_flag("完成石洞") then
    return
end

local options = {
    "打开（内力>50）",
    "离开",
}

local idx = show_quick_selections(options)
switch(idx) {
    ["1"] = function()
        local stat = role_attr("司徒来也", stat_key.MaxMp)
        if stat > 50 then
            avg_talk("司徒来也", "这玄铁箱虽有些沉重，倒也不难打开。")
            avg_talk("", "铁箱开启，其中放置着一把短弓，一身铠甲，一本书。")
            add_player_item("稀有弓", 1,"#(0-2)")
            add_player_item("稀有中甲", 1,"#(0-2)")
            add_player_item("破岳虎弓法", 1)
            set_flag("完成石洞")
        else
            avg_talk("司徒来也", "都怪我功夫不够好，这个大铁箱我打不开。")
        end
    end,
    ["2"] = function()
        return
    end
}