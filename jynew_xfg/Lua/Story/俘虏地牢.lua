show_stage("bg_192.png", "虎焰堂")
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")

--初始化位置和朝向
dark_all_actors()
situ:setPos(1100, 75)
situ:face_left()
qiliuge:setPos(700, 75)
qiliuge:face_right()

qiliuge:say("掌门，我们在战斗中俘虏的敌人，都可以关在地牢里。")
qiliuge:say("如何处置，还请您定夺。")
situ:say("六哥请教我，都有哪些手段？")
qiliuge:say("或放或留，或以金银交换，或以诚意感化，全凭掌门您的意愿。另外，如果想的话……也可以上一下高压手段（邪恶）")
situ:say("甚妙！（如果有俘虏了敌人的话，找时间去地牢看看吧。）")
hide_all_stage_bubble()
black_scene(0.25)
hide_stage()
set_flag("完成俘虏地牢")
light_scene(0.25)
