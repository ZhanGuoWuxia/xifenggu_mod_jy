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

qiliuge:say("掌门，我们战斗胜利次数已经达到100次了，我们已经算是百战百胜了。")
situ:say("是啊，我们经历了无数的战役，也从中汲取了不少经验和教训。")
qiliuge:say("掌门，你的武功日臻炉火纯青了，好像都没有对手了。")
situ:say("没有对手，未必是件好事。你知道，没有对手的话，就很难有提高。")
qiliuge:say("掌门，你这是谦虚。")
situ:say("我只是说实话而已。")

hide_all_stage_bubble()
set_flag("完成百战百胜")
tgr_achivement("百战百胜")
restore_api.add_fire_point(5)
black_scene()
hide_stage()
light_scene()

