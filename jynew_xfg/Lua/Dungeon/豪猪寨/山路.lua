avg_talk("", "山路崎岖，越走越陡峭。只听到山风呼啸，不时有石块从山上滚落。若要往前，还需当心。")

if has_flag("完成山路") then
    return
end

local options = {
    "上前询问",
    "离开",
}

local idx = show_avg_select("", "前方山路中徘徊着两个山贼，一身的匪气。", options)
switch(idx) {
    ["1"] = function()
        avg_talk("司徒来也", "敢问二位，这荒山野岭，前不着村后不着店，在这儿有什么好待的？")
        avg_talk("[speaker:山贼甲]", "滚滚滚！此处是我们老大的地盘，旁的少问！")
        avg_talk("[speaker:山贼乙]", "对，快滚！")
        avg_talk("司徒来也", "好生霸道啊！这山岭从来都是无名无姓，二位这么说恐怕不大好吧？")
        avg_talk("[speaker:山贼甲]", "呸！如今可就有名有姓了，你小子别是找茬来的？")
        avg_talk("[speaker:山贼乙]", "再不滚，爷爷们可不客气！")
        avg_talk("司徒来也", "路见不平，倒还真想理论理论什么叫做“客气”！")
        local ret = dungeon_battle("豪猪寨", "山路之战")
        if ret == 1 then
            avg_talk("[speaker:山贼甲]", "你们别嚣张！有种等着！自有厉害的来收拾你们！")
            avg_talk("[speaker:山贼乙]", "就、就是！咱们、咱们走着瞧！")
            avg_talk("", "两个山贼逃走了。")
            avg_talk("司徒来也", "看身影，这两个山贼，似乎是豪猪长垄的弟子？")
            set_flag("完成山路")
        else
            dungeon_fail("豪猪寨")
        end
    end,
    ["2"] = function()
        return
    end
}


set_flag("完成山路")