
show_stage("bg_174.png", "豪猪寨")
play_bgm("Music/舒缓_云淡风轻.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("汤白牛")

--初始化位置和朝向
bright_all_actors()
situ:setPos(1300, 75)
npc:setPos(-400, 75)
situ:face_left()
npc:face_right()

wait_twn(npc:movetoX(900), npc:daze())
npc:say("掌门好身手！虎焰门的武功当真厉害！")
situ:say("哪里哪里，我也只不过是行走江湖，有些功夫傍身而已。")
npc:say("我也想像掌门那样，做一个行侠仗义的高手！")
situ:say("好，有志者事竟成！哈哈哈，那你可要认真练武，更要有持之以恒的定力了呀。")
npc:say("嗯！以后跟着掌门学功夫，做个了不起的大侠！")
situ:say("是了，等等？跟着我？")
npc:say("是呀，掌门这么厉害，跟着掌门在虎焰门也能学到不少本事！")
situ:say("这……哈哈，好吧！")
npc:say("真的吗？太好了！")

hide_all_stage_bubble()

change_favor_by_id("汤白牛", 1)

black_scene(0.25)
hide_stage()
set_flag("完成汤白牛剧情1")
light_scene(0.25)
