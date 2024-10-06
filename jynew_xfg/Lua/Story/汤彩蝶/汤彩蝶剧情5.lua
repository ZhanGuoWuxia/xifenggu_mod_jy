
show_stage("bg_172.png", "选妃桥")
play_bgm("Music/舒缓_云淡风轻.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("汤彩蝶")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(900), situ:daze())

situ:say("汤神医！我正四处寻找你呢，没想到在这里遇到了！")
npc:say("掌门找我有事？")
situ:say("当然有事！是为了你之前写的那本话本子。我已经迫不及待地看完了，可故事却在关键时刻戛然而止，这让我实在好奇后续发展啊！")
npc:say("掌门这么快就看完了？")
situ:say("可不是吗？神医的故事引人入胜，让人欲罢不能。只是现在故事停在了关键处，我实在想知道接下来会发生什么。")
npc:say("掌门偏爱，我当然感到欣慰。只是我对武学实在知之甚少，所以写不下去了。")
situ:say("这个好说！我们虎焰门中有很多武学书册，神医有空的时候可以随时翻阅。")
npc:say("竟然有这种好事？掌门真是雪中送炭啊！")
situ:say("别说雪中送炭，就算是日月星辰，只要神医需要，我都愿意双手奉上！")
npc:say("哎呀，我不过是随便写些故事而已。掌门这样夸奖，我实在受不起。")
situ:say("神医过谦了。你的才华我是知道的，希望你能继续写下去，让我们都能看到更多精彩的故事。")
npc:say("谢谢掌门的鼓励和支持，我会努力的。")

hide_all_stage_bubble()

change_favor_by_id("汤彩蝶", 1)

black_scene(0.25)
hide_stage()
set_flag("完成汤彩蝶剧情5")
light_scene(0.25)
