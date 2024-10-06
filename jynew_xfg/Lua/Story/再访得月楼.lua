show_stage("得月楼.png", "得月楼")
play_bgm("Music/舒缓_云淡风轻.wav")
light_scene(0.25)

local situ = actor("司徒来也")
local suyanyan = actor("苏嫣嫣")

--初始化位置和朝向
situ:setPos(-200, 75)
situ:face_right()
suyanyan:setPos(1300, 75)
suyanyan:face_right()

wait_twn(situ:offsetX(1000), situ:daze())
situ:say("姑娘，伤重未愈，此番传信过来，言语之中却十分含糊，莫非是有什么要紧的事情需要当面说清？")
wait_twn(suyanyan:flip(0.2), suyanyan:daze())
suyanyan:say("正是如此……公子心细实在难得可贵。")
situ:say("嫣嫣姑娘怎么声音更显柔弱了？这是怎么了？")
suyanyan:say("嗯……可能是重伤未愈，气息尚未恢复。小女子有一不情之请，还望公子一定帮忙！")
situ:say("哪里话，先前因虎焰门同豪猪长垄的恩怨，无端牵连了得月楼，倒是我们过意不去。此番姑娘若有需要，但说无妨！")
suyanyan:say("(player:fname)公子，实不相瞒，楼中的姐妹<color=red>小红</color>半个月前便音讯全无，我实在担心……")
hide_all_stage_bubble()

local options = {
    "姑娘是想让我帮忙寻找小红下落？",
    "既然如此，不知可有些什么别的线索？",
}
local idx = show_quick_selections(options)

switch(idx) {
    ["1"] = function()
        situ:say("若是要寻找小红姑娘，这倒也不算难事，只是不知还有无其他线索？")
        wait_twn(suyanyan:offsetX(-200), suyanyan:daze())
        suyanyan:say("公子侠义心肠，只是此事当真棘手，一时竟不知如何说起了。")
        situ:say("姑娘莫急，倒不如先想想小红姑娘为何离开，或是有什么去处，这样也好有个寻找的方向呀。")
        suyanyan:say("公子有所不知，得月楼的姑娘，大多是出生在虎苇地的女儿村，再被送来得月楼的。")
        situ:say("如此说来，或许这女儿村中也有些小红姑娘的线索也说不定？总算有些头绪，不妨前往一探究竟。")
        suyanyan:say("本当亲自陪同，奈何伤病未愈，实难成行，此番便拜托公子了。")
        situ:say("姑娘放心，我自会尽力而为。")
    end,
    ["2"] = function()
        situ:say("姑娘言语间似乎藏有难言之隐，莫非其中还有什么曲折，不便直言？")
        wait_twn(suyanyan:offsetX(-200), suyanyan:daze())
        suyanyan:say("正如公子所言，此事确实颇为复杂，非是故意隐瞒，实在是千头万绪，不知从何说起。")
        situ:say("在下不才，但到底也是旁观者清，兴许能帮姑娘想到些线索？")
        suyanyan:say("小红她近日来神情恍惚，我当初未能深究，谁知竟至如此……")
        situ:say("姑娘先莫急，不知其中有什么内情，倒不妨细细说来？")
        suyanyan:say("公子有所不知，这得月楼的姐妹们，多是出自虎苇地的女儿村。及至年岁稍长，便来到这得月楼中，鬻歌卖笑，赚些生活所需。")
        suyanyan:say("我总觉着，小红的心事定与女儿村中发生的变故有关。")
        suyanyan:say("近年来，有几个姐妹返回故乡后便音讯全无。我曾托人探查，却始终无果。心中忧虑，恐怕小红也是遭遇了不测。")
        situ:say("既然如此，女儿村必有线索可寻。如今别无他法，我便前往一探究竟。")
        suyanyan:say("本当亲自陪同，奈何伤病未愈，实难成行，此番便拜托公子了。")
        situ:say("这个好说！姑娘也请安心养伤，我这便前往女儿村。")
        set_flag("获得失踪线索")
    end,
}
hide_all_stage_bubble()
pop_tip("解锁副本：女儿村")

black_scene(0.25)
set_flag("完成再访得月楼")
hide_stage()
light_scene(0.25)
