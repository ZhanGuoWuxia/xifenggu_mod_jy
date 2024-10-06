
show_stage("门派宫殿.png", "飞星云顶")
play_bgm("Music/.mp3", 0.1)
light_scene(0.2)

local moguang = actor("墨光")
local moying = actor("墨影")

--初始化位置和朝向
bright_all_actors()

moguang:setPos(500, 75)
moguang:face_right()
moying:setPos(800, 75)
moying:face_left()

moguang:say("这下完了！观星殿都未能守住！门派中武功秘籍都在里边，这下不得被虎焰门那帮人克死了……")
moying:say("阴阳王轻视虎焰门，只怕……")
moguang:say("这个节骨眼就别“只怕”了，再这么下去，是怕得不得了……")
moying:say("阴阳王心不在焉，与平日里大相径庭，很是不对……")
moguang:say("不只是阴阳王，这子瑾风也是！竟也不知在哪里溜号，只剩咱们带着众弟子死拼，这怎么撑得住？")
moying:say("听说子瑾风与那虎焰门掌门师出同门，想来他是故意避开……")
moguang:say("哼，他们这师兄弟之间岂会真的以死相搏？别帮着对面打咱们就不错了，只是……阴阳王也总得清醒些，别事事都信了子瑾风的话才是！")
moying:say("保命要紧，暂且撤退，但愿阴阳王能因此觉醒……")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成盛焰燎星")
light_scene(0.25)
