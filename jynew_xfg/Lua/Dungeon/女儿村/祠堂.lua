avg_talk("", "祠堂前，一块巍然悬挂的门匾上书“陈家祠”，金字黑底，充满庄严与威严。")

local function avg_select()
    local options = {
        "老者",
        "进入祠堂",
        "离开",
    }

    local idx = show_avg_select("", "祠堂前，一位老者正在独自打扫，看衣着打扮，似乎是族长一类的人物。", options)

    switch(idx)
    {
        ["1"] = function()
            if is_in_dungeon("了空", "女儿村") then
                if not has_flag("看过族谱") then
                    avg_talk("了空", "老人家，我是小僧了空，想来打听一下关于陈家后人的事情。")
                    avg_talk("[speaker:族长]", "陈家后人？你同陈家是什么关系？")
                    avg_talk("了空", "小僧是孤儿，因当初被寺中收养时，身上有这陈家村的信物，故而想要知道自己同陈家有些什么关系。")
                    avg_talk("[speaker:族长]", "莫非……是当年逃过一劫的男婴？！")
                    avg_talk("[speaker:族长]", "内堂放着陈家族谱，或许里面有你想知道的一切。冤孽啊！都是冤孽啊！")
                    avg_talk("了空", "阿弥陀佛，多谢族长。")
                    set_flag("显示族谱")
                    avg_select()
                else
                    if not has_flag("完成祠堂") then
                        avg_talk("[speaker:族长]", "这族谱中写着的，都看过了吧。")
                        avg_talk("了空", "族长，这到底是怎么回事？")
                        avg_talk("[speaker:族长]", "就像这里面写的那样，当初天灾之年，江湖大乱，各大门派互相攻伐，这小小的陈家村已不能幸免于难。当时的族长陈大成，为了全村人能活命，便做下了这件天谴之事：")
                        avg_talk("[speaker:族长]", "族中勾连商贾高官，建了得月楼，再各处搜罗年轻女子，送往那烟花之地。以此换取钱粮维生。而那些男婴，却在天灾之年被……唉！造孽啊！")
                        avg_talk("[speaker:族长]", "从此之后，陈家村可能遭到了天谴，村里再无男婴出生，或许男婴只能弃于水塘……久而久之，因这村中只见女子，故而被称为“女儿村”。")
                        avg_talk("了空", "阿弥陀佛，或许小僧此行，正是要化解这段孽缘的。")
                        avg_talk("司徒来也", "那当真是冥冥之中的因果轮回了。")
                        set_dungeon_task_result("女儿村", "调查了空身世", true)
                        tgr_achivement("陈家后人")
                    elseif not has_flag("完成地牢") then
                        avg_talk("[speaker:族长]", "从此之后，陈家村可能遭到了天谴，村里再无男婴出生，或许男婴只能弃于水塘……久而久之，因这村中只见女子，故而被称为“女儿村”。")
                        avg_talk("了空", "阿弥陀佛，或许小僧此行，正是要化解这段孽缘的。")
                        avg_talk("司徒来也", "冥冥之中自有因果轮回啊。")
                    end
                    set_flag("完成祠堂")
                end
            end

            if has_flag("获得白花线索") then
                if not has_flag("完成地牢") then
                    avg_talk("司徒来也", "老人家，我听说此间有位叫白花的姑娘也失踪了？")
                    avg_talk("[speaker:族长]", "正是！她是老朽的孙女，可是有她的下落了？")
                    avg_talk("司徒来也", "老人家先别急，我们或许能帮上些忙，听说她是在祠堂失踪的？")
                    avg_talk("[speaker:族长]", "是！当时白花儿在内堂读书，我同她说要出去一会儿，可谁知回来的时候，人就不见了。")
                    avg_talk("司徒来也", "那当时可曾去周围寻找过？")
                    avg_talk("[speaker:族长]", "老朽那时找遍了祠堂内外，还询问了村中。想着离开的时候也不长，她一个女娃能走多远？")
                    avg_talk("司徒来也", "那她可曾遇到什么人，或是与谁亲厚，兴许会知道些信息？")
                    avg_talk("[speaker:族长]", "哦，我想起来了，一周前，有一个穿着红色花裙的少女来找过她，好像是她儿时的玩伴。")
                    avg_talk("司徒来也", "这便是了！我们便是寻找小红才寻到这里的！")
                    if not has_flag("绑架推理") then
                        local opts = {
                            "莫非小红同白花都遭遇了什么事情？",
                            "难道白花的失踪，与小红有什么关联？",
                        }
                        local i = show_avg_select("", "这件事情倒是要仔细思索一番", opts)
                        switch(i)
                        {
                            ["1"] = function()
                                avg_talk("司徒来也", "小红同白花在一处，莫非两人都遇到了什么？")
                                local flag = get_flag_int("获得小红线索")
                                set_flag_int("获得小红线索", flag - 1)
                            end,
                            ["2"] = function()
                                avg_talk("司徒来也", "白花失踪定然与小红有关，却不知小红？")
                                local flag = get_flag_int("获得小红线索")
                                set_flag_int("获得小红线索", flag + 2)
                            end,
                        }
                        set_flag("绑架推理")
                    end
                    avg_talk("司徒来也", "放心，我们定会找到白花姑娘的。")
                    avg_talk("[speaker:族长]", "那真是老天开眼，老朽先行谢过几位大恩了！")
                else
                    avg_talk("司徒来也", "看，这是谁回来了！")
                    avg_talk("[speaker:白花]", "爷爷！爷爷！是我呀！")
                    avg_talk("[speaker:族长]", "白花？白花，你终于回来了！")
                    avg_talk("[speaker:族长]", "老朽当真没什么好报答恩人的，不过是祖上留下的老物件儿，若不嫌弃，还望恩人一定收下！")
                    add_player_item("族长的家传之戒", 1)
                    change_favor_by_id("司徒来也", 2)
                    avg_talk("司徒来也", "如今此间事情了结，我们也该回去了。")
                    tgr_achivement("真相大白")
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
                    set_flag("完成女儿村")
                    dungeon_success("女儿村")
                end
            end
        end,
        ["2"] = function()
            avg_talk("", "祠堂内，古老的红墙静静守望，精美的木雕和香烛散发着岁月的沧桑，空气中充盈着祖辈祭拜的香烟气息，一本厚厚的族谱摆放在供桌上。")

            if has_flag("显示族谱") then
                avg_talk("", "陈家族谱，沿着书脊悄然静卧，黄褐色的纸质，翻开后，一行行小字映入眼帘：仕国贻元昌，忠和达建章。正大芳明显，传家启佑良。")
                if not has_flag("看过族谱") then
                    avg_talk("", "了空手指颤抖地翻动着族谱，他的眼睛在族谱上不停地扫过，翻到他出生的那一页，他的眼睛停了下来。")
                    avg_talk("", "上面写着：陈家第十八代，易子而食、溺亡、遗弃、不知所终、无后，等等字样。")
                    avg_talk("", "了空面无表情，可一行清泪却悄然落下。")
                    avg_talk("司徒来也", "小长老，许是世道变迁，这册子记录不全，具体如何情况，不若问问族长再做定夺？")
                    avg_talk("了空", "阿弥陀佛……也只有如此了……")
                    set_flag("看过族谱")
                    avg_select()
                end
            end
        end,
        ["3"] = function()
            return
        end,
    }
end

avg_select()
