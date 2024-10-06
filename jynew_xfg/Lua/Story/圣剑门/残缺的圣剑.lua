
local subtitles = {"深夜 观剑阁"," 观剑阁室内 "}

--初始化场景和背景音乐
show_cg({subtitles[1]})
show_stage("温泉.png", "观剑阁")
play_bgm("Music/.mp3", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local wanglong = actor("王珑")

--初始化位置和朝向
bright_all_actors()

situ:setPos(-400, 75)
situ:face_right()
wanglong:setPos(800, 75)
wanglong:face_left()

wait_twn(situ:movetoX(300),situ:daze())
situ:say("听闻阁主一直在帮百里烟波寻找贵派遗失的腾云圣剑？")

wanglong:say("正是。")
wait_twn(situ:movetoX(500),situ:daze())
situ:say("我在摇舟半岛寻得半截残剑，不知可是此物？")
wanglong:jump()
wanglong:say("这……怎会……还请借一步说话！")
hide_all_stage_bubble()
wanglong:flip()
wanglong:movetoX(2500)
wait_twn(situ:movetoX(2500),situ:daze())
situ:setPos(-400, 75)
wanglong:setPos(-400, 75)

show_cg({subtitles[2]})
show_stage("写意室内.png", "观剑阁室内")
situ:movetoX(500)
wait_twn(wanglong:movetoX(1000),wanglong:daze())
wanglong:flip()

situ:say("相传此物乃圣剑门无上至宝，如今我手握此剑，岂非可号令整个圣剑门了？")
wanglong:shake()
wanglong:say("咳咳……百里大人确实说过执剑可号令门中上下，但那时腾云圣剑是在他的手上。何况，你手上这圣剑也只是残缺的……")

situ:say("哈哈，王阁主莫要紧张，我就是想请你带个路，我想见见百里烟波。")

wanglong:say("见执剑人？你想做什么？")
situ:say("听闻百里烟波知晓夜鸦的踪迹，我只想问清夜鸦之事便会离开，这圣剑也自当奉还，免得虎焰门与圣剑门一番苦斗。")
wanglong:shake()
wanglong:say("执剑人正在闭关修炼，在此期间，无论是谁都别想见他……")
situ:flip()
situ:say("那看来，这断剑岂非无缘归还……")
wanglong:say("贵派寻这残剑不过是希望我阁中不与贵派为敌，不若你我以这断剑为约？你只要不将此事告知给第三人，尤其是其他三阁，我阁中自不会与虎焰门争斗。")
situ:flip()
situ:say("这就奇了怪了，之前不是阁主一直要找圣剑，如今我帮你找到了居然不要，还不让我说出去，这又是何意？")
wanglong:say("这腾云圣剑乃圣剑门圣物，若是他们圣剑断裂，定会人心大乱！到时又是一番风波，与贵派也无益不是？")
local options = {
  "也好……便应了他。",
  "圣剑门大乱，关我何事？"
}
local idx = show_quick_selections(options)
switch(idx) {
  ["1"] = function()
    situ:say("王阁主心系大局，此胸怀让人佩服，我就帮你保守秘密！")
    wait_twn(wanglong:offsetY(-50),wanglong:daze())
    wanglong:say("那便多谢了。")
    wait_twn(situ:movetoX(700),situ:daze())
    situ:say("阁主不必，阁主武功深厚，少一强劲对手，也与我有利……")
    wanglong:offsetY(50)
  end,
  ["2"] = function()
    situ:jump()
    situ:flip()
    situ:say("圣剑门人心大乱，对我来说不正是好事，我倒要看看这百里烟波什么时候才会出山。")
    wanglong:jump()
    wanglong:say("这……既然阁下如此紧逼，那我阁中也自会亮剑了！")
  end,
}

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成残缺的圣剑")
light_scene(0.25)
