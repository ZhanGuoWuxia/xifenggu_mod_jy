show_stage("庭院.png", "虎焰堂外")
set_bg_mat("ImgPaperFold")
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(1100, 75)
situ:face_left()
qiliuge:setPos(700, 75)
qiliuge:face_right()

situ:say("诸位同门，今日我(player:fullname)在此宣布：承蒙各地百姓的鼎力相助，以及诸位兄弟姐妹的不懈奋斗，虎焰门终于重夺了失去的疆土！")
qiliuge:say("掌门，星星之火，可以燎原。如今正是我虎焰门大展宏图之时，请速速回复各地<color=red>发展度</color>，让这火种燃遍四方！")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成玩家收复失地")
light_scene(0.25)
executefile("Guide/重燃虎焰_引导")
