show_stage("酒香亭.png", "酒家")
play_bgm("Music/回忆.wav")
set_bg_mat("ImgPaperFold")
light_scene(0.2)

local qiliuge = actor("齐六哥")
local lai3 = actor("赖三")
local situ = actor("司徒来也")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(-400, 75)
situ:face_right()
qiliuge:setPos(-600, 75)
qiliuge:face_right()
lai3:setPos(1400, 75)
lai3:face_left()

situ:movetoX(1100)
wait_twn(qiliuge:movetoX(800), qiliuge:daze())

situ:say("赖三兄，之前你所展示的机关术师承何人？")
lai3:say("(player:fname)掌门，你有所不知，远古时期此处曾是”机关府“，它通过陷阱和机关设置，来消耗敌方状态。")
qiliuge:say("原来如此！让我们把”机关府“重建起来，发挥它的作用。")
situ:flip()
situ:say("就按六哥说的办！")

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("已解锁陷阱机关")

pop_tip("现在可以在<color=red>机关房</color>执行<color=#ff7a00>设置陷阱机关</color>计谋了。")
light_scene(0.25)
