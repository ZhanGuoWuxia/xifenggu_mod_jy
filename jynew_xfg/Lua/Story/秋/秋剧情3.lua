show_stage("bg_219.png", "虎焰堂")
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

wait_twn(situ:movetoX(900), situ:daze())

situ:say("少年，今日可愿与我谈谈心？")
qiu:say("……")
situ:say("也罢，他日有缘再谈。我听闻，你父母的离世，与一种奇草有关？")
qiu:say("草，百毒不侵。")
situ:say("那是何草？")
qiu:say("父母所种，却被歹人夺去，他们因此坠崖。")
situ:say("原来如此，你因此幸存。")
qiu:say("狼。")
situ:say("江湖传言，你是狼群养大。")
qiu:say("狼血，流于我身。")
situ:say("即便如此，你也不必过于认真，毕竟，你只是喝了狼奶长大。")
qiu:say("复仇。")
situ:say("我明白了，此仇不报，誓不为人。那百毒不侵的草，便是我们唯一的线索。")

change_favor_by_id("秋", 1)

black_scene(0.25)
set_flag("完成秋剧情3")
hide_stage()
light_scene(0.25)
