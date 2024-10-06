
show_stage("bg_219.png", "虎焰堂")
play_bgm("Music/舒缓_云淡风轻.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("齐六哥")

--初始化位置和朝向
bright_all_actors()
situ:setPos(1300, 75)
npc:setPos(-400, 75)
situ:face_right()
npc:face_right()

situ:jump(50, 4, 0.5)
wait_twn(npc:movetoX(900), npc:daze())

npc:say("掌门，您看上去愁眉不展？莫非有什么忧心之事？")
situ:flip()
situ:say("唉，不过是随意翻阅了门中的账本，看了之后不禁有些忧虑。")
npc:say("哈哈，掌门，这些日常开销的账目确实让人头疼，流水账簿本就是如此复杂。")
situ:say("六哥，你平时就是负责这些琐碎的事务吗？")
npc:say("是的，掌门。这不过是诸多事务中的一部分。门派的日常用度、节庆开销、人情往来，都是些繁琐的工作。")
situ:say("只是听听，我就觉得头大了。幸好有六哥你帮忙处理这些事务……")
npc:say("这不算什么，我在其他方面可能不太在行，但在理账和统筹这些事情上，还算有点本事。")
situ:say("六哥，你不必太过谦虚。在我看来，这可是我们虎焰门目前最需要的技能了。门派的发展离不开你的这份细心和才华。")

hide_all_stage_bubble()

change_favor_by_id("齐六哥", 1)

black_scene(0.25)
hide_stage()
set_flag("完成齐六哥剧情2")
light_scene(0.25)
