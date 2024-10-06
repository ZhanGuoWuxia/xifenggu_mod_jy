avg_talk("", "马厩之中的马匹品种各异，这村里虽不热闹，但也不是与世隔绝，应当都是些往来行人在此歇马休息吧。")

if has_flag("完成马厩") then
    return
end

local options = {
    "武林人士",
    "离开",
}

local idx = show_avg_select("", "马厩旁边聚了不少人，看样子都是武林人士。", options)

switch(idx) {
    ["1"] = function()
        avg_talk("司徒来也", "豪猪长垄？你们这些杂鱼在此鬼鬼祟祟，想盘算什么？")
        avg_talk("豪猪堂主", "妈的，是谁走漏了风声？居然被发现了。")
        avg_talk("司徒来也", "什么意思？你们安了什么心？")
        avg_talk("豪猪堂主", "如今看来，只能杀人灭口了！")

        local ret = dungeon_battle("女儿村", "马厩之战")
        if ret == 1 then
            avg_talk("豪猪堂主", "看不出来还挺扎手，溜了溜了！")
            avg_talk("司徒来也", "豪猪长垄的人居然跑到这里来撒野，真是不知死活！")
            avg_talk("司徒来也", "不对！该不会是有人指引他们到此？豪猪长垄一直在掠夺年轻女子……小红姑娘、得月楼、女儿村……怕是其中有什么阴谋！")
            set_flag("完成马厩")
            set_dungeon_task_result("女儿村", "解决马厩麻烦", true)
        else
            dungeon_fail("女儿村")
        end
    end,
    ["2"] = function()
        return
    end,
}