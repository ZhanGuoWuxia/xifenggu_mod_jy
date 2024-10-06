avg_talk("", "一座年代久远的木桥横跨清澈流水，古朴木质栏杆间细雨丝丝，轻风掠过，伴着鸟语潺潺流水声。")

local options = {
    "老者",
    "离开",
}

local idx = show_avg_select("", "桥上有一位老者，他双手背在身后，一副悠闲的样子。", options)

switch(idx) {
    ["1"] = function()
        avg_talk("司徒来也", "叨扰了，我等初来乍到，能否请指点一下前方的道路？")
        avg_talk("[speaker:老者]", "年轻人，欢迎来到女儿村。很简单，沿着桥往前走，第一个岔路口右拐就是村口。")
        avg_talk("[speaker:老者]", "左拐就是客栈，直行则可到达村中央，那便有一个十字路口，再右转则是一片民居，左转则是祠堂。")
        avg_talk("[speaker:老者]", "若还不认得，有不少女娃娃常在村口、道路旁玩耍，也可以去问问。")
        avg_talk("司徒来也", "多谢老伯指点。")
        set_flag("完成木桥")
    end,
    ["2"] = function()
        return
    end,
} 