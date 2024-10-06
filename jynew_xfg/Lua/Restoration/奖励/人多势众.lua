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

qiliuge:say("掌门，你看，我们虎焰门最近成功招募了30个的门派弟子，此番可喜可贺啊！")
situ:say("是啊，我们的门派规模越来越壮大，真是可喜可贺。")
qiliuge:say("想当初，我们虎焰门被灭门，在夹缝中生存，如今却拥有了这么多的门下弟子，实在是一段令人感慨的历程啊。")
situ:say("是啊，这一路走来，我们历经了无数的困难和挑战，但是我们从未放弃。")
qiliuge:say("是啊，掌门。我们不能忘记初心，更不能满足于现状。")
situ:say("没错，我们的路还很长，需要不断地努力和前进。")

hide_all_stage_bubble()
set_flag("完成人多势众")
tgr_achivement("人多势众")
restore_api.add_fire_point(5)
black_scene()
hide_stage()
light_scene()
