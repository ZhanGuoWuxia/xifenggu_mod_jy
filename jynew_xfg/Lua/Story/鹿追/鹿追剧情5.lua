show_stage("bg_186.png", "鹿追的房间")
play_bgm("Music/少女鹿追.wav")

local luzhui = actor("鹿追")
local situ = actor("司徒来也")

--初始化位置和朝向
dark_all_actors()
situ:bright()
situ:setPos(600, 75)
situ:face_right()

luzhui:face_right()
luzhui:setPos(900, 75)

luzhui:offsetX(200, 100)
wait_twn(situ:offsetX(200, 100), luzhui:flip())

luzhui:say("夫君今天状态怎么样？")
situ:emotion("WeiXiao")
situ:say("非常不错，浑身都是劲，精神得很。")
luzhui:say("那就好，这才像个掌门的样子。")
situ:say("小鹿，我发现你有一种魔力。")
luzhui:say("什么魔力？")
situ:emotion("WeiSuo")
situ:say("和你在一起，人就会变得精力充沛，对什么事情都充满了信心，就像南方的阔叶林沐浴了阳光，枝和叶都想舞动起来。")
luzhui:say("哈哈，这是夫君今日的情话吗，说得我脸都红了。")
situ:say("我是真的有这种感觉。")

change_favor_by_id("鹿追", 1)

pop_tip("对鹿追的称呼改为“鹿儿”")

black_scene(0.25)
hide_stage()
set_flag("完成鹿追剧情5")
light_scene(0.25)
