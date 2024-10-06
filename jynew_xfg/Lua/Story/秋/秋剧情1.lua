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

situ:say("秋兄，在虎焰门之中，可还习惯？")
qiu:say("……")
situ:say("我看你这般沉默，定是心中有事。")
qiu:say("……")
situ:say("听闻秋兄酒量惊人，不知可有此事？")
qiu:say("……")
situ:say("好！好！我就喜欢你这般沉默是金的性格。")
situ:say("待你哪天愿意开金口，我定当洗耳恭听，与你把酒言欢。")

change_favor_by_id("秋", 1)

add_player_item("苍狼丹", 1)

black_scene(0.25)
set_flag("完成秋剧情1")
hide_stage()
light_scene(0.25)
