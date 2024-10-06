
show_stage("bg_219.png", "虎焰堂")
play_bgm("Music/舒缓_云淡风轻.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
local liuming = actor("刘明")
local zsniang = actor("朱三娘")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
situ:face_right()
qiliuge:setPos(700, -500)
qiliuge:face_right()
liuming:setPos(1300, 75)
liuming:face_left()
zsniang:setPos(1100, 75)
zsniang:face_right()

wait_twn(situ:movetoX(600), situ:daze())

situ:say("刘明，朱三娘，你们两个在这里嘀咕什么呢？")
liuming:jump()
zsniang:flip()
wait_twn(zsniang:jump(), zsniang:daze())
liuming:say("哎呀，原来是掌门啊！当真吓我一跳！")
situ:say("你们两个怎么这么神秘兮兮的？")
zsniang:say("嘘——掌门小声些！此事说与掌门倒也没什么，只是千万声张！")
situ:say("到底什么事这么神秘？")
zsniang:say("这不是齐总管的生辰快到了嘛。")
liuming:say("我们想着大家最近都挺辛苦的，想趁着这个机会好好庆祝一下！")
situ:say("这个主意不错！算我一份！")
liuming:say("我打算那天在虎焰门里多布置些花草，弄得漂亮些！")
zsniang:say("我特地去酒香亭那边，跟厨子磨了好久，学了些点心小菜的做法，那都是齐总管爱吃的。")
wait_twn(qiliuge:jumpTo(900, 75), qiliuge:daze())
qiliuge:say("这样也太破费了。")
situ:say("唉？！六哥！")
liuming:say("完了……露馅了……")
qiliuge:emotion("HaiXiu")
qiliuge:say("近来咱们日子过得都不怎么宽裕，真没必要为了我一个人如此兴师动众的。")
zsniang:say("那是自然、那是自然！不过终归是生辰嘛。")
qiliuge:say("咳咳……大家的心意我领了，不过我这么大年纪了，一切从简就好。")
hide_all_stage_bubble()
qiliuge:flip()
wait_twn(qiliuge:jump(), qiliuge:movetoX(-500))
liuming:say("哦嚯，惊喜没了……")
situ:say("不过我怎么觉得齐六哥离开的时候，还是挺开心的呢。")
zsniang:say("哈哈，我也是第一次看到齐总管这么不好意思呢。")
situ:say("我说，惊喜还是要有的！咱们该怎么安排就怎么安排！齐六哥辛苦了这么久，也该好好庆祝一下！")

hide_all_stage_bubble()

change_favor_by_id("齐六哥", 2)

black_scene(0.25)
hide_stage()
set_flag("完成齐六哥剧情3")
light_scene(0.25)
