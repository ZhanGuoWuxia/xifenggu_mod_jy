if has_flag("完成民居") then
    avg_talk("", "一间普通的民居，可似乎经历了一场不普通的厮杀，歪歪斜斜竟是倒了一地尸体。")
    return
end

if has_flag("完成客栈") then
    local is_ok = yes_or_no("<color=red>重要事件</color>影响剧情走向是否进入？")
    if not is_ok then
        return
    end
    avg_talk("", "远远便瞧见红裙少女被一群黑衣人围着，生死正悬于一线之间。")
    avg_talk("[speaker:小红]", "你们这些恶人！不怕遭报应吗？")
    avg_talk("司徒来也", "小红姑娘？姑娘莫怕！我们这就收拾了这帮恶贼！")
    avg_talk("豪猪堂主", "怎么又是你？这次是想英雄救美？")
    avg_talk("司徒来也", "败类！快放了她！")
    
    local ret = dungeon_battle("女儿村", "民居之战")
    if ret == 1 then
        avg_talk("豪猪堂主", "你小子别嚣张！敢有歪心思，老子可就下手就做了她！")
        avg_talk("司徒来也", "你敢！")
        avg_talk("", "豪猪堂主一把抓住小红的脖子，挥舞着手中的刀，向(player:fullname)扑了过来。")
        avg_talk("", "(player:fullname)为了救小红，胸口被刺了一刀，但豪猪堂主也被(player:fullname)的刀刺中了心脏。")
        avg_talk("[speaker:小红]", "义士……义士你怎么样了？")
        avg_talk("司徒来也", "没事，没事，我没事。你就是小红吧？")
        avg_talk("[speaker:小红]", "是的，我就是小红。")
        
        print("获得小红线索：" .. get_flag_int("获得小红线索"))
        if get_flag_int("获得小红线索") > 2 then
            avg_talk("司徒来也", "小红姑娘，不知白花姑娘可跟你在一处？")
            avg_talk("[speaker:小红]", "白花？不曾见，白花她怎么了？")
            avg_talk("司徒来也", "别装了，其实绑架白花姑娘的，便是你对吧。")
            avg_talk("[speaker:小红]", "你、你……你别血口喷人！")
            avg_talk("司徒来也", "若是无凭无据，又怎么敢妄下结论？只怪你百密一疏，暴露了与豪猪长垄勾结的事实！")
            avg_talk("[speaker:小红]", "哼！竟是输在了这里……")
            avg_talk("司徒来也", "快说！白花姑娘在哪？")
            avg_talk("[speaker:小红]", "哈哈，你们嚣张什么？最后还不得来求我？")
            avg_talk("司徒来也", "既然如此，白花姑娘性命攸关，便莫怪我们先礼后兵了！得罪！")
            avg_talk("", "(player:fullname)押着小红出民居，逼她去找寻白花下落。")
            set_flag("完成民居")
            set_dungeon_task_result("女儿村", "寻找小红", true)
            set_dungeon_task_result("女儿村", "真相大白", false)
        else
            avg_talk("司徒来也", "小红姑娘！我是受得月楼的苏嫣嫣姑娘之托来寻你回去的。")
            avg_talk("[speaker:小红]", "嫣嫣姐姐她有心了。")
            set_flag("完成女儿村")
            set_dungeon_task_result("女儿村", "寻找小红", true)
            if has_flag("完成祠堂") then
                local opts = {
                    "邀请小和尚一起回去",
                    "一个人回去",
                }
                local i = show_avg_select("", "不妨问问了空", opts)
                switch(i)
                {
                    ["1"] = function()
                        avg_talk("司徒来也", "小长老，将来可有去处？不妨来我们虎焰门？")
                        avg_talk("了空", "阿弥陀佛，小僧想留在这里给村里的人传扬天道循环、阴阳平衡的佛理，多做些功德，也好帮助这些人赎清罪孽。")
                        avg_talk("司徒来也", "既然如此，若将来有缘，我们后会有期！")
                        avg_talk("了空", "善哉善哉！此番同行也算因缘际遇，小僧身无长物，只有本《少林心法》，也算做个纪念。")
                        add_player_item("少林心法", 1)
                        avg_talk("司徒来也", "小长老，我会在虎焰门一直等你。")
                    end,
                    ["2"] = function()
                        avg_talk("司徒来也", "小长老，我们就此别过，万望珍重！")
                    end,
                }
            end
            dungeon_success("女儿村")
        end
    else
        dungeon_fail("女儿村")
    end
else
    avg_talk("", "简单朴素的民居，普普通通，空无一人。")
end 