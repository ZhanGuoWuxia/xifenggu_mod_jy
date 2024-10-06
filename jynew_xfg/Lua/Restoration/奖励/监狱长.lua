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

qiliuge:say("掌门，我们俘虏人次已经达到20了，地牢已经人满为患，我们该怎么办？")
situ:say("从地牢中选出一些有潜力的人，纳入我门，训练他们，让他们成为我们的一员。")
qiliuge:say("掌门，你真是英明啊。")
situ:say("你过奖了。我们共同努力，才能有今天的成就。")

hide_all_stage_bubble()
set_flag("完成监狱长")
tgr_achivement("监狱长")
restore_api.add_fire_point(5)
black_scene()
hide_stage()
light_scene()

