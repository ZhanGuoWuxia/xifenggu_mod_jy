local options = {
    "谷堆",
    "谷山",
    "离开",
}

local idx = show_avg_select("", "打谷场上，谷穗扎成堆，谷子堆成山，如丰收的骄阳，静静地矗立在场间。", options)

switch(idx) {
    ["1"] = function()
        if has_flag("开始捉迷藏") then
            if not has_flag("找到小女孩甲") then
                local opts = {
                    "小女孩甲",
                    "离开",
                }

                local i = show_avg_select("", "果然躲在谷堆里之中，小姑娘甲被发现之后探着头笑了。", opts)

                switch(i) {
                    ["1"] = function()
                        avg_talk("司徒来也", "找到你了！")
                        avg_talk("[speaker:小女孩甲]", "大哥哥你真厉害，这么快就找到了。")
                        avg_talk("司徒来也", "你也很厉害呀，我可是找了好久呢。")
                        avg_talk("[speaker:小女孩甲]", "那我先回去等你喽。")
                        set_flag("找到小女孩甲")
                        add_dungeon_task_progress("女儿村", "捉迷藏", 1)
                    end,
                    ["2"] = function()
                        return
                    end,
                }
            else
                avg_talk("", "有股清香的味道，正是新鲜稻谷的香味。")
            end
        else
            avg_talk("", "谷堆前后什么都没有，想来人不在这里。")
        end
    end,
    ["2"] = function()
        if has_flag("开始捉迷藏") then
            if not has_flag("完成村口") then
                if not has_flag("完成谷山") then
                    avg_talk("司徒来也", "找到了——怎么是个光头？你是谁？！")
                    avg_talk("豪猪土匪", "可恶！竟然发现了弟兄安插在这里的暗哨，你小子死定了！")

                    local ret = dungeon_battle("女儿村", "马厩之战")
                    if ret == 1 then
                        avg_talk("豪猪土匪", "妈的，算你有点本事！下次定要把你碎尸万段！")
                        avg_talk("司徒来也", "豪猪长垄竟在这里布下了暗哨，莫非有什么阴谋？")
                        set_flag("完成谷山")
                    else
                        dungeon_fail("女儿村")
                    end
                else
                    avg_talk("", "寻着动静看过去，原来是一只母鸡正带着一群小鸡在谷堆中觅食。")
                end
            else
                avg_talk("", "周围似乎有动静，可仔细查看并没有异样，难道是错觉？")
            end
        else
            avg_talk("", "此处一望可及，空空如也。")
        end
    end,
    ["3"] = function()
        return
    end,
}
set_flag("完成打谷场")