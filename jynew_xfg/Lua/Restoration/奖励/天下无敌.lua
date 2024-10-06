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

qiliuge:say("掌门，你武功已经升无可升，好友遍布天下，已经达到天下无敌的境界了。")
situ:say("无敌吗？我可不敢这么说。江湖之大，或许还有比我更强的存在。")
qiliuge:say("掌门，你这是谦虚。")
situ:say("不过，我也明白，就算有更强的存在，我也不应该畏惧。")

hide_all_stage_bubble()
set_flag("完成天下无敌")
tgr_achivement("天下无敌")
restore_api.add_fire_point(5)
black_scene()
hide_stage()
light_scene()

