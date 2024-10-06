
show_stage("酒香亭.png", "酒家")
play_bgm("Music/回忆.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("汤白牛")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1400, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(900), npc:offsetY(-100), npc:daze())
npc:say("掌门！您于危难之际救我阿姐，此恩此德，汤白牛没齿难忘，愿肝脑涂地，以报您的深恩！")
situ:say("这是……为何要行此大礼，使不得使不得！")
npc:offsetY(100)
npc:say("掌门，您救了我阿姊，这份恩情，我会永远记得的！")
situ:say("白牛何必如此多礼，江湖险恶，路见不平，拔刀相助乃是武林中人的本分。你阿姊的事，不过是举手之劳。")
npc:say("白牛心向往之，也想成为掌门这样的侠之大者，行走江湖，助人为乐。")
situ:say("好，有志者事竟成！哈哈哈，那你可要认真练武，更要有持之以恒的定力了呀。")
npc:say("嗯！以后跟着掌门学功夫，做个了不起的大侠！")
situ:say("是了，等等？跟着我？")
npc:say("是呀，掌门这么厉害，跟着掌门在虎焰门也能学到不少本事！")
situ:say("这……哈哈，好吧！")
npc:say("真的吗？太好了！")
situ:say("令姐对虎焰门有诸多帮助。我若不照顾好你，也没办法对你阿姊交代呀！")
npc:say("我要跟我阿姊说，我以后是去虎焰门学功夫的！可不是到处胡闹！")

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成白牛谢恩")
light_scene(0.25)