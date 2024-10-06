
show_stage("bg_219.png", "虎焰堂")
play_bgm("Music/舒缓_云淡风轻.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("齐六哥")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_right()

wait_twn(situ:movetoX(900), situ:daze())

situ:say("哎呀，夜已深，六哥竟还未安寝？")
npc:flip()
npc:say("掌门不也没歇着？")
situ:say("我在翻阅那些武学秘籍，不觉间夜已深沉。六哥又是因为什么？")
npc:say("不过是咱们门中的些许杂事，待处理完，便去休息了。")
situ:say("齐六哥处理这些事情很是辛苦。")
npc:say("多谢掌门挂念，我会注意的。掌门也早点安歇，明日还有诸多事宜待决。")
situ:say("好，六哥，且共盼明日。")
npc:say("掌门，晚安。")

hide_all_stage_bubble()

change_favor_by_id("齐六哥", 1)

add_player_item("灵龟丹", 1)

black_scene(0.25)
hide_stage()
light_scene(0.25)
