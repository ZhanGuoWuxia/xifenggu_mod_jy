avg_talk("", "半人高的小门，门上有一块木匾，上面写着“豪猪寨”三个大字，往里看则是一排土坯房屋。")

if has_flag("完成寨门") then
    return
end

local options = {
    "潘麻子",
    "梁胜",
    "离开",
}
local idx = show_avg_select("", "看到两个人影，其中一个是潘麻子，另一个是梁胜，他们这是想作甚？", options)
switch(idx) {
    ["1"] = function()
        if has_flag("完成释放何猛") then
            avg_talk("司徒来也", "怎么是你们？你们在这里打什么算盘？")
            avg_talk("潘麻子", "还真是冤家路窄，竟然追到这里……")
            avg_talk("司徒来也", "你们又聚集在这寨子做甚？莫不是又要干些打家劫舍的勾当？")
            avg_talk("梁胜", "呸！你小子算哪根葱？我们做什么又与你何干？少管闲事！")
            avg_talk("司徒来也", "哼！今天这闲事，我还管定了！")
        else
            avg_talk("司徒来也", "你们？在这里做什么？")
            avg_talk("潘麻子", "竟然是你！大哥的仇，我们没去找你报呢。你竟先找上门了！")
            avg_talk("梁胜", "兄弟们，为了大哥报仇雪恨，咱们一起上！")
            avg_talk("司徒来也", "你们这些家伙，先前网开一面，留你们一命，竟还不知足！")
        end

        local ret = dungeon_battle("豪猪寨", "寨门之战")
        if ret == 1 then
            avg_talk("", "潘麻子和梁胜逃走了。")
            avg_talk("司徒来也", "竟然让两个家伙逃走了……不管了，先进去看看再说。")
            set_flag("完成寨门")
        else
            dungeon_fail("豪猪寨")
        end
    end,
    ["2"] = function()
        if has_flag("完成释放何猛") then
            avg_talk("司徒来也", "怎么是你们两个？")
            avg_talk("梁胜", "怎么你这小子总是阴魂不散地跟着我们？")
            avg_talk("司徒来也", "你们又聚集在此作甚？先前平了豪猪长垄，竟还不改邪归正？")
            avg_talk("潘麻子", "晦气，遇到你这灾星就倒霉。")
            avg_talk("司徒来也", "哼！这便是“多行不义必自毙”！看招！")
        else
            avg_talk("司徒来也", "潘麻子？梁胜？你们在此处作甚？")
            avg_talk("梁胜", "你？我们没去找你算账呢！你害我们兄弟沦落，我们要报仇！")
            avg_talk("潘麻子", "真是“天堂有路你不走，地狱无门你偏投”！受死吧！")
            avg_talk("司徒来也", "你们这些鼠辈，先前已经留你们一条性命，竟还不知足？")
        end
        
        local ret = dungeon_battle("豪猪寨", "寨门之战")
        if ret == 1 then
            avg_talk("", "潘麻子和梁胜逃走了。")
            avg_talk("司徒来也", "逃得倒快！若想追上他们，得先进去探探情况再说。")
            set_flag("完成寨门")
        else
            dungeon_fail("豪猪寨")
        end
    end,
    ["3"] = function()
        return
    end
}