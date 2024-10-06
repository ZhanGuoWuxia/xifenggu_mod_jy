
show_stage("西门香的房间.png", "西门香的房间")
play_bgm("Music/西门香.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("西门香")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:offsetX(900), situ:daze())

npc:say("(player:fullname)，问你个问题。")
situ:say("（打起十二分精神）啊，香儿请讲！")
npc:say("不用这么紧张，我不过是想问问，我的剑法是否更加迅捷了？")
situ:say("那是必然的，你每天勤奋不辍的练习，有明显的进步。")

npc:say("你以为我想问你什么啊？")
situ:say("唔……记得小时候，我将一枚玉环赠予了一位小女孩，你却哭得天昏地暗，当时让我好生不解。")
npc:say("这个你也还记得？")
situ:say("那是我第一次见你如此伤心，心中自是难忘。")
npc:say("那是一次两家同游摇舟半岛，那小女孩乃是岛主的千金，名叫小霞。")
situ:say("小霞，小霞……")

npc:flip()
npc:say("你念念不忘，可是对她仍有所牵挂？")
situ:say("呃…… ")

npc:flip()
npc:say("哈，呆子，逗你玩的！")
npc:say("之后听说一场无名火海将岛上之人尽皆吞噬，自那以后，江湖上便少了那一派，而夜鸦的传闻也由此开始。")
situ:say("所谓夜鸦之谜，关系到我父母大仇，无论是何等凶险，我(player:fullname)誓要揭开。")

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成摇舟半岛")
light_scene(0.25)
