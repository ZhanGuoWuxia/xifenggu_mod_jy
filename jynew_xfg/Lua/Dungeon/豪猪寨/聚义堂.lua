avg_talk("", "山寨中间是挂着牌匾的厅堂，虽然简陋，但也算敞亮。上书“聚义厅”，还供着一尊“关圣帝君”金身。不远处，还有什么人走了过来。")

if has_flag("完成猪圈") then
    avg_talk("司徒来也", "潘麻子？看不出来你这二当家，养猪竟也养得有声有色啊。")
    avg_talk("潘麻子", "现在不过是区区几头，日后自然会让你见识到这豪猪寨的气势。")
    avg_talk("司徒来也", "那我可就拭目以待了。")
    avg_talk("潘麻子", "好，好，一言为定。")
    set_flag("完成豪猪寨")
    dungeon_success("豪猪寨")
    return
end

if has_flag("完成释放何猛") then
    local options = {
        "潘麻子",
        "梁胜",
        "离开",
    }

    local idx = show_avg_select("", "定睛一看，来人竟是潘麻子和梁胜，他们在此作甚？", options)

    switch(idx) {
        ["1"] = function()
            avg_talk("司徒来也", "你们怎么在这里？")
            avg_talk("潘麻子", "你又为何在此？莫非还想赶尽杀绝？")
            avg_talk("司徒来也", "我怎会出尔反尔？只是听说此地山贼聚集，特来除害。")
            avg_talk("潘麻子", "哪里有什么山贼，不过是我和三弟的老部下，豪猪长垄现在也只剩下这一处了。")
            avg_talk("司徒来也", "何猛呢？他有没有改邪归正？")
            avg_talk("潘麻子", "我还正想问你呢？自从你废了老大后，他就失踪了……")
            avg_talk("司徒来也", "你们在此处打家劫舍，莫非是想卷土重来？")
            avg_talk("潘麻子", "呸！你未免也太小看人了！我潘麻子虽算不上什么正派君子，可江湖信义还是懂得！")
            avg_talk("司徒来也", "那你们……")
            avg_talk("潘麻子", "你这一路走来，想必也都见到了。")
            avg_talk("司徒来也", "你是说，那些猪是你们养的？")
            avg_talk("潘麻子", "我们兄弟三人最早便是养猪起家，后来颇得了些家资，这才渐渐有了豪猪长垄的这一片势力。")
            avg_talk("司徒来也", "既然如此，那你们又何必去做那些伤天害理的勾当？")
            avg_talk("潘麻子", "人在江湖，身不由己。你养尊处优，如何又能知道我们兄弟一路过来的难处？")
            avg_talk("司徒来也", "借口倒是不少。")
            avg_talk("潘麻子", "小子，你见识尚浅，我也不与你争辩。先前兄长没来找我时，我也曾这般想法……罢了，如今回归本行，倒不失为一种福气。")
            avg_talk("司徒来也", "这番唏嘘倒不像假意，若有机缘，倒想见识见识你的本行了。")
            set_flag("完成聚义堂")
        end,
        ["2"] = function()
            avg_talk("司徒来也", "梁胜，竟然是你！")
            avg_talk("梁胜", "你，你……怎敢在此、在此造次？")
            avg_talk("司徒来也", "听闻这里聚集了一伙山贼，想不到竟然是你！")
            avg_talk("梁胜", "什、什么山贼？我、我跟你可聊不着，我嘴笨，你和二哥唠唠。")
        end,
        ["3"] = function()
            return
        end,
    }
else
    local options = {
        "潘麻子",
        "梁胜",
        "离开",
    }

    local idx = show_avg_select("", "定睛一看，其中来人竟是潘麻子和梁胜，他们想作甚？", options)

    switch(idx) {
        ["1"] = function()
            avg_talk("司徒来也", "你们往哪里跑！")
            avg_talk("潘麻子", "可恶！如此赶尽杀绝！今儿我们弟兄索性跟你拼了！")
            avg_talk("梁胜", "弟兄们，为了大哥报仇雪恨！咱们上！")

            local ret = dungeon_battle("豪猪寨", "寨门之战")
            if ret == 1 then
                avg_talk("", "潘麻子和梁胜死了。")
                avg_talk("司徒来也", "这两个家伙，虽说都是下九流的混混，倒还是有些义气。")
                set_flag("完成豪猪寨")
                dungeon_success("豪猪寨")
            else
                dungeon_fail("豪猪寨")
            end
        end,
        ["2"] = function()
            avg_talk("司徒来也", "你们还想跑？")
            avg_talk("潘麻子", "呸！老子虽然落难，难道还怕了？拼了！")
            avg_talk("梁胜", "弟兄们，为了大哥！为了豪猪长垄的仇！上啊！")

            local ret = dungeon_battle("豪猪寨", "寨门之战")
            if ret == 1 then
                avg_talk("", "潘麻子和梁胜死了。")
                avg_talk("司徒来也", "这两个家伙，虽说是些屠狗之辈，竟有几分血性……")
                set_flag("完成豪猪寨")
                dungeon_success("豪猪寨")
            else
                dungeon_fail("豪猪寨")
            end
        end,
        ["3"] = function()
            return
        end,
    }
end