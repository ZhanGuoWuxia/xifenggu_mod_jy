avg_talk("", "此间是个湖心亭，中央有一口井，虽深但却清澈见底。亭子四周种满了花草，充满生气。")

if has_flag("开始捉迷藏") then
    if not has_flag("找到小女孩乙") then
        local opts = {
            "小女孩乙",
            "离开",
        }

        local i = show_avg_select("", "小女孩乙躲藏在亭子的一角，还不时探出头来四处张望。", opts)

        switch(i) {
            ["1"] = function()
                avg_talk("司徒来也", "出来吧，找到你了。")
                avg_talk("[speaker:小女孩乙]", "算你厉害，这样都能被你找到。")
                avg_talk("司徒来也", "你也藏得很好呀，差点就让你赢了。")
                avg_talk("[speaker:小女孩乙]", "那当然，虽然你赢了，可我也很厉害呢！")
                set_flag("找到小女孩乙")
                add_dungeon_task_progress("女儿村", "捉迷藏", 1)
            end,
            ["2"] = function()
                return
            end,
        }
    end
end



if not is_in_dungeon("了空", "女儿村") then
    local options = {
        "小和尚",
        "离开",
    }
    
    local idx = show_avg_select("", "亭子里站着一个小和尚，菩提念珠绕在他项上，他双手合十，不喜不怒，站如一座钟。", options)

    switch(idx) {
        ["1"] = function()
            avg_talk("司徒来也", "小长老，不知可否请教一事？")
            avg_talk("了空", "阿弥陀佛，施主请说。")
            avg_talk("司徒来也", "我叫(player:fullname)，是虎焰门掌门。受人之托来到此地。只是初来乍到，故而想先探探村中规矩，免得无意冒犯。")
            avg_talk("了空", "施主有所不知，小僧是神隐寺的了空，受师父之命来这里寻找自己的身世，也是初来乍到。")
            avg_talk("司徒来也", "这样啊。那不知小长老可否愿意一同前往？")
            avg_talk("司徒来也", "实不相瞒，我等为了打探一位叫做小红的姑娘的线索，也是一路寻访至此。既是都想打探村中信息，两厢一同调查，岂不便宜？")
            avg_talk("了空", "阿弥陀佛，想来相识也是缘分，或许是佛祖指引也未可知，小僧愿一同前往。")
            avg_talk("司徒来也", "既然如此，那便结伴而行好了。")
            role_join_dungeon("了空", "女儿村")
            set_dungeon_task_result("女儿村", "调查了空身世", false)
        end,
        ["2"] = function()
            return
        end,
    }
end