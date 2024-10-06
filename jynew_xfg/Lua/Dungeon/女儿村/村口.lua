avg_talk("", "村口，在村口的一侧，一块悬挂着古旧门牌，上面书写着“陈家村”几个字，字迹虽已斑驳，倒还是能依稀辨认。")

if not has_flag("开始捉迷藏") then
    local options = {
        "一群小女孩",
        "离开",
    }

    local idx = show_avg_select("", "一群小女孩在欢声笑语中嬉戏玩耍。", options)

    switch(idx) {
        ["1"] = function()
            avg_talk("司徒来也", "几位小友，在下想询问些事情，不知可否帮忙？")
            avg_talk("[speaker:小女孩甲]", "哈哈，大哥哥你说话可真奇怪！不过我们正在捉迷藏。这样好了，若赢了我们便帮，如何？")
            avg_talk("司徒来也", "有趣有趣！既然如此，怎么才算赢？")
            avg_talk("[speaker:小女孩乙]", "大哥哥你闭着眼睛数十个数，我们会藏在村里的各处，你要是找到我们，就算你赢了。")
            avg_talk("[speaker:小女孩丙]", "不许偷看！也不许数太快！来不及躲的话，就算大哥哥耍赖！")
            avg_talk("司徒来也", "好好好！那若我赢了，你们可一定要帮忙哦！")
            avg_talk("", "小女孩们一边笑着，一边四散跑开，各自找寻藏身之处。")
            avg_talk("司徒来也", "一、二、三、四、五、六、七、八、九、十！")
            avg_talk("", "十个数已经数完，快些寻找那些小女孩的躲藏之处吧。")
            set_flag("开始捉迷藏")
            add_dungeon_task_progress("女儿村", "捉迷藏", 0)
        end,
        ["2"] = function()
            return
        end,
    }
else
    if has_flag("找到小女孩甲") and has_flag("找到小女孩乙") and has_flag("找到小女孩丙") then
        avg_talk("司徒来也", "哈哈，找到你们了！")
        avg_talk("[speaker:小女孩甲]", "大哥哥你可真厉害，居然这么快就找到了！")
        avg_talk("[speaker:小女孩乙]", "我还以为藏得很好呢，居然被发现了。")
        avg_talk("[speaker:小女孩丙]", "算了算了，到底是大人，被找到也是没办法的事情。")
        if not has_flag("完成捉迷藏") then
            avg_talk("[speaker:小女孩甲]", "躲藏的时候捡到了这个，就给你吧！")
            avg_talk("司徒来也", "好啊，那还真是多谢小友了。")
            add_player_item("史诗护腕", 1, "#(0-2)")
            set_flag("完成捉迷藏")
        end
        if has_flag("获得小红线索") then
            avg_talk("司徒来也", "既然我赢了，那是不是该你们帮我的忙了？")
            avg_talk("[speaker:小女孩甲]", "大哥哥你说吧，我们不会耍赖的！")
            avg_talk("司徒来也", "这村里有个叫小红的大姐姐你们认识吗？")
            avg_talk("[speaker:小女孩乙]", "小红姐姐？当然认识了，她前阵子还来看我们了呢！")
            avg_talk("司徒来也", "那她什么时候来的？")
            avg_talk("[speaker:小女孩丙]", "小红姐姐上一周每天来找我们玩，每次都给我们带糖吃。")
            avg_talk("司徒来也", "那后来呢？她又去了哪里？")
            avg_talk("[speaker:小女孩甲]", "没有，她只是问了问其他姐姐的情况和去处。")
            avg_talk("司徒来也", "原来是这样……")
            if not has_flag("完成村口") then
                local flag = get_flag_int("获得小红线索")
                set_flag_int("获得小红线索", flag + 2)
                set_flag("完成村口")
            end
            avg_talk("司徒来也", "多谢你们，帮了这么大一个忙！")
        end
    else
        avg_talk("司徒来也", "这里什么都没有，再去别处找找。")
    end
end