local subtitles = {"⻁焰⻔"}

--初始化场景和背景音乐
show_cg(subtitles)
show_stage("殿内.png", "⻁焰⻔")
set_bg_mat("ImgPaperFold")
light_scene(0.2)
play_bgm("Music/山雨欲来风满楼.wav", 0.2)

--初始化人物
local situ = actor("司徒来也")
local luzhui = actor("鹿追")

--初始化位置和朝向
dark_all_actors()
situ:setPos(2500, 75)
situ:face_left()
luzhui:setPos(2700, 75)
luzhui:face_left()

--剧情
situ:movetoX(600)
wait_twn(luzhui:movetoX(1000),luzhui:daze(0))
wait_twn(situ:flip(),situ:daze(0))
luzhui:jump()
wait_twn(luzhui:flip(),luzhui:flip())
wait_twn(play_sfx("Voice/Female2_Laugh_2.wav"),luzhui:say("哈哈哈，太好了太好了！"))
situ:say("能让你这么欣喜若狂的事⼉就只有这岁炙叶了，莫⾮……")
luzhui:jump()
luzhui:say("没错！今年的岁炙叶提前⻓出了！今天早晨我摘到了第三百⽚岁炙叶！")
situ:say("那太好了！这炙家历代的愿望要在⼩⿅你⾝上实现了！")
situ:say("我也倒是能⼀睹这攒⻬了三百⽚岁炙叶，所唤醒的⽕神之⼒到底有多⼤威⼒！")
luzhui:flip()
luzhui:say("唉，只是可惜……")
situ:jump()
situ:say("可惜什么？")
luzhui:flip()
luzhui:say("还不是那苏半⻅，说好将⼗九⽚叶⼦还回来，现在没有踪影……")
luzhui:say("到现在我⼿上只有⼆百⼋⼗⼀⽚，就差这被盗⾛的⼗九⽚叶⼦。")
situ:shake()
situ:say("这个苏半⻅！说好要还，却⼀直占为⼰有，简直⼩⼈，可不能让他破坏了你炙家数百年的⼤计，定要找他取回来！")
luzhui:flip()
luzhui:say("这……现在正是⻔派重建，如若前去讨要岁炙叶……")
luzhui:say("因为⼩⿅⼉之事破坏了⻁焰⻔与暮霭⼭庄的和⽓？不⾏不⾏……绝对不⾏！")

hide_all_stage_bubble()
local options = {
  "为了⼩⿅你，得罪暮霭⼭庄⼜如何？",
  "暮霭⼭庄势⼤，可也不能⾔⽽⽆信，不如向苏半⻅施压，讨要岁炙叶。",
}
local idx = show_quick_selections(options)
switch(idx) {
  ["1"] = function()
    wait_twn(situ:movetoX(800),situ:daze(0))
    situ:say("有何不可？为了你能够顺利召唤出⽕神之⼒，不说⼀个暮霭⼭庄了，只要能助⿅追完成家族愿望，就算是上⼑⼭下⽕海也不怕！")
    luzhui:flip()
    luzhui:shake()
    luzhui:say("这……这份恩情，⼩⿅⼉⽆以为报……")
  end,
  ["2"] = function()
    wait_twn(situ:movetoX(1700),situ:daze(0))
    situ:flip()
    situ:say("你说的不⽆道理……")
    hide_all_stage_bubble()
    wait_twn(situ:movetoX(1200),situ:daze(0),situ:jump())
    situ:say("只是当下这岁炙叶定要夺回来才⾏。")
    luzhui:say("既然上次他说了要还，那便得还！")
    situ:jump()
    situ:say("先去暮霭⼭庄，去看看着苏半⻅到底是何意思，要是能直接要回那⾃然是好……")
    situ:say("如若不然，另寻法⼦就是。")
    luzhui:shake()
    luzhui:say("没想到你居然能为了我做到如此地步，当真让我⽆以为报。")
    situ:say("我说过了，你的事⼉就是我的事⼉，话不多说，我们直接去往暮霭⼭庄吧。")
    luzhui:flip()
    situ:movetoX(-300)
    luzhui:movetoX(-300)
  end
}


hide_all_stage_bubble()


black_scene(0.5)
hide_stage()
set_flag("完成第三百片")
light_scene(0.25)
