
local subtitles = {"一番打斗过后…"}

--初始化场景和背景音乐
show_cg(subtitles)
show_stage("室内书房.png", "磨剑阁")
play_bgm("Music/血魔老祖.wav", 0.1)
light_scene(0.2)

local langzigui = actor("朗自归")
local situ = actor("司徒来也")
local qiu = actor("秋")

--初始化位置和朝向
bright_all_actors()

langzigui:setPos(1100, 75)
langzigui:face_right()
situ:setPos(1600, 75)
situ:face_left()
qiu:setPos(1800, 75)
qiu:face_left()

--剧情
situ:say("吃我一招！")
play_sfx("Voice/Male2_Attack_1.wav")
hide_all_stage_bubble()
situ:rotatetoZ(20)
situ:movetoX(1200,5000)
shake_stage()
play_sfx("Story/Fist.mp3")
wait_twn(langzigui:rotatetoZ(45),situ:rotatetoZ(-20),langzigui:movetoX(300,5000))
wait_twn(langzigui:daze(),langzigui:rotatetoZ(-45,0.2))
langzigui:say("咳咳……")
situ:jump()
situ:say("这落梅金茎是邱白石夫妇半生苦心研究栽培的成果，你不仅占为己有还伤人性命，简直罪不可恕！你这“铁佛”应该叫“铁魔”才对吧！")
langzigui:say("我自知没有资格将这等宝物占为己有，我早就将其交给了应该拥有此物之人，这是天道所归。")
situ:jump()
situ:say("天道？说得冠冕堂皇，不过只是你的一己之私！")
langzigui:jump()
langzigui:say("哼，你们不也为了一己之私找了些冠冕堂皇的由头？！今日磨剑阁被你们鸠占鹊巢，他日我定让你们加倍奉还！")
hide_all_stage_bubble()
langzigui:flip()
langzigui:movetoX(-400,4000)
qiu:jump()
qiu:say("休走！这笔账，还未算完！")
hide_all_stage_bubble()
situ:movetoX(-400,4000)
qiu:movetoX(-400,4000)


black_scene(0.25)
hide_stage()
set_flag("完成攻下磨剑阁")
light_scene(0.25)
