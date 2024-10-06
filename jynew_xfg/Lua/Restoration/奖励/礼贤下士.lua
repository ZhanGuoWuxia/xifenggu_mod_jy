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

qiliuge:say("掌门，我看你最近都消瘦了，是不是又在忙着招募门下弟子了？")
situ:say("是啊，为了壮大我们虎焰门的势力，我必须亲自去寻找有潜力的弟子，这才会比较放心。")
qiliuge:say("不过……掌门你是我们虎焰门的核心，你的身体健康，对我们虎焰门的发展至关重要啊！")
situ:say("谢谢你的关心，六哥。但是努力是值得的，你看，咱们虎焰门下已经招揽有如此多的人才了")
qiliuge:say("是啊掌门，你的贤明让各路英雄豪杰汇聚一堂，虎焰门的复兴指日可待。")

hide_all_stage_bubble()
set_flag("完成礼贤下士")
tgr_achivement("礼贤下士")
restore_api.add_fire_point(5)
black_scene()
hide_stage()
light_scene()

