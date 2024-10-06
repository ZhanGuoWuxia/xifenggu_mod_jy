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

situ:say("六哥，有一句话说“高手之下，皆是蝼蚁”，你可知何义？")
qiliuge:say("这是说，拥有一个武林高手就可在息风谷立足，而没有武林高手的门派，都是蝼蚁。")
situ:say("哈哈，我们虎焰门拥有6个武林高手了，岂不是叱咤风云？")
qiliuge:say("恭喜掌门，虎焰门的实力越来越强了。")

hide_all_stage_bubble()
set_flag("完成门派精英")
tgr_achivement("门派精英")
restore_api.add_fire_point(5)
black_scene()
hide_stage()
light_scene()

