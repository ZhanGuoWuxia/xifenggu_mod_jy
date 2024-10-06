local subtitles = {"抚剑阁"}

--初始化场景和背景音乐
show_cg(subtitles)
show_stage("紫色大厅.png", "抚剑阁")
play_bgm("Music/抉择_一念之间.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local jiyeman = actor("姬野蔓")

--初始化位置和朝向
bright_all_actors()

situ:setPos(2500, 75)
situ:face_left()
jiyeman:setPos(600, 75)
jiyeman:face_left()

wait_twn(situ:movetoX(1300),situ:daze())
jiyeman:flip()
jiyeman:say("怎么是你？难道是忘了紫色玫瑰所寄之信了吗？")
local options = {
  "原来是姬阁主……就是想念了，故来拜访。",
  "大义当前，顾不了这么多了。"
}
local idx = show_quick_selections(options)
switch(idx) {
  ["1"] = function()
    situ:say("原来是姬阁主……就是想念了，故来拜访。")
    jiyeman:shake()
    jiyeman:say("你这般拜访？何必跟着这么多凶神恶煞的大汉煞风景？下回一人前来可好？")
  end,
  ["2"] = function()
    situ:say("大义当前，顾不了这么多了。")
    jiyeman:jump()
    jiyeman:say("无信义之人，算我姬野蔓看错了人！")
  end,
}

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成攻打抚剑阁")
light_scene(0.25)
