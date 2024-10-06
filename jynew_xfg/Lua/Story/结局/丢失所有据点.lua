show_stage("bg_1.png", "虎焰门")
--通用灭门结局

local situ = actor("司徒来也")

--初始化位置和朝向
bright_all_actors()
situ:setPos(800, 75)
situ:face_right()
situ:say("到此为止了么?")

stage_narration("虎焰门最终还是没能在你手中复兴，湮没在渺渺江湖之中")

black_scene(0.25)
hide_stage()
game_over()
