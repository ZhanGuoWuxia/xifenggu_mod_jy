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

situ:say("哎呀，六哥，我居然有10个死党了！")
qiliuge:say("掌门，你的人缘真是好啊！")
situ:say("哈哈，我自己都有点不敢相信呢！但是事实就摆在眼前，我必须得承认，我这魅力四射、万人迷的形象果然不是浪得虚名啊！")

hide_all_stage_bubble()
set_flag("完成社交达人")
tgr_achivement("社交达人")
restore_api.add_fire_point(5)
black_scene()
hide_stage()
light_scene()

