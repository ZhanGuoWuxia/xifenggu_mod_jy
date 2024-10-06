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

qiliuge:say("掌门，虎焰门终得6个地块建设度皆超60，可谓是非凡之成就！")
situ:say("非凡之成就？哈哈，这不是我一个人功劳，是我们大家共同努力的结果。")
qiliuge:say("是啊，我们历经千辛万苦，方才有今日之局面。")
situ:say("虽然过程很辛苦，但是结果是好的。相信虎焰门会越来越强大。")
qiliuge:say("诚然，虎焰门如今之成就，更需警醒以应对未来之挑战。")
situ:say("不错，我们不能满足于现状，需时刻准备迎接未来之挑战。")
qiliuge:say("是，掌门。让我们齐心协力，守护虎焰门的辉煌！")

hide_all_stage_bubble()
set_flag("完成基建狂魔")
restore_api.add_fire_point(5)
tgr_achivement("基建狂魔")
black_scene()
hide_stage()
light_scene()

