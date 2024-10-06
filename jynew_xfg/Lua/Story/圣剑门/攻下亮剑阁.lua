local subtitles = {"亮剑阁"}

--初始化场景和背景音乐
show_cg(subtitles)
show_stage("华丽大厅.png", "亮剑阁")
play_bgm("Music/.mp3", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
local fandaoping = actor("范道平")

--初始化位置和朝向
bright_all_actors()

situ:setPos(2500, 75)
situ:face_left()
qiliuge:setPos(2700, 75)
qiliuge:face_left()
fandaoping:setPos(2500, 75)
fandaoping:face_right()

wait_twn(fandaoping:rotatetoZ(45),fandaoping:movetoX(300,5000))
wait_twn(fandaoping:rotatetoZ(-45),fandaoping:daze())
fandaoping:say("咳咳……")
fandaoping:jump()
fandaoping:say("朗自归和姬野蔓这两个东西，死哪儿去了？这虎焰门都攻上山了，还不来帮忙！")

situ:movetoX(1000)
wait_twn(qiliuge:movetoX(1500),qiliuge:daze())
situ:say("圣剑门四大剑阁，号称一个阁之强可顶息风谷一门一派，原来这大敌当前，各自为营，也就如此啊。")
fandaoping:shake()
fandaoping:say("你……你这猖狂的小子，待我去寻百里大人出山，定让你有来无回！")
fandaoping:movetoX(-500,2000)
situ:jump()
situ:say("范阁主还真是心口不一，面上嚣张，却跑的丢盔卸甲，着实滑稽。")
wait_twn(qiliuge:movetoX(1300),qiliuge:daze())
qiliuge:say("阁主，这范道平掉落的似是一件银丝甲……")
situ:flip()
situ:say("这银丝甲到是古怪，薄如蝉翼，当真能防住刀枪吗？")
qiliuge:say("这似是天蚕壳，相传专防荆棘兰，我还听闻，这似乎还有反射的作用……")
situ:say("荆棘兰？那不是姬野蔓的招术吗？范道平这家伙，对自己人还……")
qiliuge:say("看来这圣剑门的内部暗潮汹涌啊……")
--补充道具天蚕壳
add_player_item("高粱酒", 1)
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成攻下亮剑阁")
light_scene(0.25)
