show_stage("村庄废墟.png", "财鬼宗废墟")
play_bgm("Music/舒缓_云淡风轻.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")

--初始化位置和朝向
dark_all_actors()
situ:setPos(-400, 75)
situ:face_right()
qiliuge:setPos(-700, 75)
qiliuge:face_right()

--先一起走过去
situ:movetoX(1100)
wait_twn(qiliuge:movetoX(800), qiliuge:daze())

situ:flip()
qiliuge:say("龙湾门就是依靠这财鬼宗，不停地向周边门派勒索抢劫，才赚的盆满钵满。")
situ:say("哈哈！你的，我的，都是我的！")

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("已解锁勒索")

pop_tip("现在可以在<color=red>财鬼宗</color>执行<color=#ff7a00>勒索抢劫</color>计谋了。")
light_scene(0.25)
