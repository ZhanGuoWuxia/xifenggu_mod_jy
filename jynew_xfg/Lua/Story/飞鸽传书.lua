show_stage("禁地.png", "训练场")
set_bg_mat("ImgPaperFold")
play_bgm("Music/我方回合.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(700, 75)
situ:face_right()
qiliuge:setPos(2200, 75)
qiliuge:face_left()

wait_twn(qiliuge:offsetX(-900), qiliuge:daze())
qiliuge:say("掌门，得月楼的苏嫣嫣飞鸽传书来了，邀您一聚。")
situ:say("恐怕有什么要紧事，我这就过去。")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成飞鸽传书")
light_scene(0.25)
