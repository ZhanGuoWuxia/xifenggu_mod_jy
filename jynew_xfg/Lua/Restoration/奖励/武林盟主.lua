show_stage("bg_15.png", "虎焰堂")
light_scene()

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")

--初始化位置和朝向
dark_all_actors()
situ:setPos(1100, 75)
situ:face_left()
qiliuge:setPos(700, 75)
qiliuge:face_right()

qiliuge:say("掌门，我们虎焰门的领地已经达到30个了，我们的势力已经遍布武林了。")
situ:say("老爹的遗愿终于实现了，我们虎焰门已经是武林盟主了。")

hide_all_stage_bubble()
set_flag("完成武林盟主")
tgr_achivement("武林盟主")
restore_api.add_fire_point(5)
black_scene()
hide_stage()
light_scene()

