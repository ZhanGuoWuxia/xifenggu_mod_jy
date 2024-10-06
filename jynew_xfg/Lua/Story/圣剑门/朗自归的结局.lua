local subtitles = {"圣剑门走廊深处"}

--初始化场景和背景音乐
show_cg(subtitles)
show_stage("走廊.png", "圣剑门")
play_bgm("Music/抒情_柔情似水.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local langzigui = actor("朗自归")
local qiu = actor("秋")

--初始化位置和朝向
bright_all_actors()

situ:setPos(2500, 75)
situ:face_left()
qiu:setPos(2500, 75)
qiu:face_left()
langzigui:setPos(2500, 300)
langzigui:face_right()


--圣剑门/朗自归的结局.lua

--剧情
wait_twn(langzigui:rotatetoZ(90),langzigui:moveTo(500,75,5000))
wait_twn(langzigui:rotatetoZ(-90),langzigui:daze())
langzigui:say("咳咳……")
wait_twn(situ:movetoX(1300),situ:daze())
situ:say("不愧是大名鼎鼎的“铁佛”，事到如今仍然面不改色。")
langzigui:say("咳咳……事已至此，似是天命……过去的罪过，均因圣剑门而起，如今圣剑门已不在，这命就当给当年的邱白石夫妇谢罪吧。")
situ:flip()
situ:say("秋，含恨多年的仇，想来也终于可以报了吧？")
hide_all_stage_bubble()

wait_twn(qiu:movetoX(1600),qiu:daze())
local options = {
  "将刀交给秋，让秋亲自手刃仇敌。",
  "杀他是脏了秋的手，倒不如让这败类活着赎罪。"
}
local idx = show_quick_selections(options)
switch(idx) {
  ["1"] = function()
    situ:jump()
    situ:say("兄弟，刀便交给你了，这人还要你亲自手刃了才好。")
    hide_all_stage_bubble()
    situ:flip()
    wait_twn(qiu:movetoX(800),qiu:daze())
    qiu:say("呜呜……爹！娘！孩儿终于为你们报仇了！")
    qiu:jump()
    shake_stage()
    langzigui:rotatetoZ(90)
  end,
  ["2"] = function()
    situ:say("这圣剑门大势已去，杀了眼前这贼人腌臜了自己的手，不如留他一命，让他日日活在罪孽之中。")
    qiu:shake()
    qiu:say("唉…")
    qiu:say("掌门所言有理，他总说弱肉强食，如今大势已去，成了案上俎肉，也算是报了当年父亲母亲之仇……")
    situ:flip()
    situ:say("朗自归听见没？我兄弟以仁待仇，留你一命，是为了证明这世间并非都是你那一套鬼逻辑！")
    langzigui:shake()
    langzigui:say("你……你们……唉……看来这虎焰门，才是今后这息风谷的主人啊……")
    situ:jump()
    situ:say("你也少在这儿假仁假义的阿谀奉承！既然让你走了，就快快离开！")
    hide_all_stage_bubble()
    wait_twn(langzigui:movetoX(900),langzigui:daze())
    langzigui:say("唉…")
    langzigui:say("你的双亲是为了保这落梅金茎，才失了命，今日我便将这宝物归还与你吧，也算是这微乎其微的赎罪吧。")
    qiu:jump()
    qiu:say("这就是父母毕生心血所研究出的落梅金茎？！")
    situ:say("落梅金茎世上只有唯一株，你不是早已经献给百里烟波了吗？")
    langzigui:flip()
    langzigui:say("唉…")
    langzigui:say("如果我献给百里烟波的那株是真的，也许他就不会夜鸦被害死了。")
    hide_all_stage_bubble()
    langzigui:movetoX(-500)
    situ:say("你……哈哈哈哈……你们这圣剑门，还真是让人倍感唏嘘啊……")
  end,
}

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成朗自归的结局")
light_scene(0.25)
