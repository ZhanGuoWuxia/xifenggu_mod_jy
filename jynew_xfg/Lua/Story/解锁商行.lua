show_stage("庭院.png", "虎焰堂外")
play_bgm("Music/日常_烟火人间.wav", 0.1)
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

situ:say("六哥，那批我未曾挑选的武学秘籍，如今可还在你那？")
npc:flip()
npc:say("哎呀，掌门，此事确实是我疏忽了，那些秘籍已被我拿到商行抵押换钱了。")
situ:say("商行又是何地？")
npc:say("商行乃是江湖中交易之所，各方人士云集，可买卖各种奇珍异宝，武功秘籍，乃至兵刃防具。掌门若有空闲，不妨前往一观。")
situ:say("也好，我这便前往商行探个究竟。")
npc:say("掌门，这次抵押秘籍所得银两，您也拿去吧。")
situ:say("六哥一番好意，我心领了。")
npc:say("掌门，商行的盛衰与当地<color=red>发展度</color>息息相关，还望掌门大兴土木，吸引更多商人前来。")
situ:say("我记住了。")

hide_all_stage_bubble()

change_favor_by_id("齐六哥", 1)

add_player_item("银两", 200)
restore_api.add_fire_point(5)

black_scene(0.25)
hide_stage()
set_flag("已解锁商行")
light_scene(0.25)
