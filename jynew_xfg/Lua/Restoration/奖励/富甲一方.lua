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

qiliuge:say("掌门，掌门，你看，这是我们虎焰门的账本，我们的财产已经达到了10万两银子了！")
situ:say("是啊，这么多年的努力总算没有白费。")
qiliuge:say("掌门，我们虎焰门也算是富甲一方了。")
situ:say("嗯，但是也不能掉以轻心。江湖险恶，需时刻提防。")
qiliuge:say("是，掌门。")

hide_all_stage_bubble()
set_flag("完成富甲一方")
tgr_achivement("富甲一方")
restore_api.add_fire_point(5)
black_scene()
hide_stage()
light_scene()

