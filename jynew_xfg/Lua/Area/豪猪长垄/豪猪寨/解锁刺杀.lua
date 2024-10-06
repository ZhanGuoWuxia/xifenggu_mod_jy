show_stage("bg_174.png", "暗影堂")
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
situ:say("六哥，这便是暗影堂了，豪猪长垄曾在此处执行暗杀和秘密行动，用来无声无息地消除对手。")
qiliuge:say("是的，掌门！这里现在归我虎焰门所有了！")

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("已解锁刺杀")

pop_tip("现在可以在<color=red>暗影堂</color>执行<color=#ff7a00>潜入刺杀</color>计谋了。")
light_scene(0.25)
