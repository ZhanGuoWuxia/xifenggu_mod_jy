show_stage("禁地.png", "训练场")
light_scene(0.2)
play_bgm("Music/秋.wav")

local situ = actor("司徒来也")
local qiu = actor("秋")

--初始化位置和朝向
dark_all_actors()
situ:setPos(-400, 75)
situ:face_right()
qiu:setPos(1300, 75)
qiu:face_left()

stage_narration("月白如水，洒在虎焰堂的练武场上，秋正在练习着自己的武功，在月光下显得格外孤独而坚定。")
wait_twn(situ:movetoX(900), situ:daze())
situ:say("秋兄，这么晚了还在练剑，莫非是忘了时间？")
qiu:say("今晚月圆之夜，我感受到一股奇特的能量在体内涌动，仿佛有什么大事即将发生。")
situ:say("莫非是要变身狼人？")
qiu:say("狼人？我倒希望如此，或许就能找到我心中的答案。")
stage_narration("话音刚落，秋的眼神突然变得空洞，仿佛在聆听远方的呼唤。他慢慢闭上眼睛，似乎在感应着什么。")
situ:say("秋兄，你怎么了？")
qiu:say("我听到一声狼嚎，从远方传来，它似乎在呼唤我。")
qiu:say("我必须去找到它。")
qiu:flip()
wait_twn(hide_all_stage_bubble(), qiu:movetoX(3000))
stage_narration("说罢，秋的身影如箭矢般射出，消失在夜幕之中。")

black_scene(0.25)
hide_stage()

show_stage("虎焰山树林.png", "虎焰山树林")
light_scene(0.2)

local qiu = actor("秋")

--初始化位置和朝向
dark_all_actors()
qiu:setPos(-400, 75)
qiu:face_right()

stage_narration("秋在月光的指引下，穿过树林，来到了一片荒野。他的目光如电，扫过四周，突然，他的眼神凝固了。")
wait_twn(qiu:movetoX(1100), qiu:daze())
qiu:say("啊！我发现一个幼小的狼崽躺在树丛中，身体瘦弱，似乎受了伤。")
qiu:say("不是，这是一只狼孩，这是我！")
stage_narration("秋的眼神渐渐软化，小心翼翼地伸出手，试图与狼孩建立某种联系。")
qiu:say("我觉醒了，我找到了真正的自己。")
qiu:say("从今往后，我将不再是孤独的狼……")

change_favor_by_id("秋", 1)
role_add_affix("秋", "狼血觉醒")
pop_tip(string.i18_format("秋获得了{0}", affix_tip_link("狼血觉醒", "狼血觉醒", "#FF7A00")))
restore_api.add_fire_point(5)

black_scene(0.25)
hide_stage()
set_flag("完成秋剧情终")
tgr_achivement("狼孩之身")
light_scene(0.25)
