
show_stage("门派宫殿.png", "飞星云顶")
play_bgm("Music/.mp3", 0.1)
light_scene(0.2)

local qiliuge = actor("齐六哥")
local hemeng = actor("何猛")
local situ = actor("司徒来也")

--初始化位置和朝向
bright_all_actors()

qiliuge:setPos(500, 75)
qiliuge:face_right()
hemeng:setPos(800, 75)
hemeng:face_left()
situ:setPos(1100, 75)
situ:face_left()

situ:say("我当是谁如此面熟，豪猪王怎替飞行云顶卖命了？")
hemeng:say("哼，贼崽子休想踏入我飞星云顶一步！必得要你们好看！")
situ:say("哈？如何这般腔调了？")
hemeng:say("废话倒是多！要你管！")
situ:say("这何猛的功夫好生诡异，竟与之前在豪猪长垄交手时完全不一样的路数……")
qiliuge:say("飞星云顶轻易不收留外人，既然收留豪猪长垄这种匪帮，功夫又如此诡异，必有些内情。")
situ:say("能与何猛有牵扯的，莫不是……")
qiliuge:say("想来不错，也就何猛那个巨人哥哥鲸有这样的手段了。")
situ:say("看来这飞行云顶确是与夜鸦组织有勾结，只可惜这个愚蠢的家伙不知道他哥哥的行踪，不然定能顺藤摸瓜找到夜鸦。")
qiliuge:say("何猛不过匹夫之勇，想必也不过是个混淆信息的喽啰罢了。还是按照掌门原定计划，盯住阴阳王石冰，他与夜鸦交往过密，必然知道内情！")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成又见豪猪")
light_scene(0.25)
