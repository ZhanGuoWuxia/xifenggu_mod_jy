
show_stage("龙万莹的房间.png", "抚剑阁")
play_bgm("Music/日常_烟火人间.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("姬野蔓")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:offsetX(900), situ:daze())


hide_all_stage_bubble()

npc:say("姬野蔓好感进度_4TODO")

change_favor_by_id("姬野蔓", 1)

black_scene(0.25)
hide_stage()
set_flag("完成妖媚的紫蛇4")
light_scene(0.25)
