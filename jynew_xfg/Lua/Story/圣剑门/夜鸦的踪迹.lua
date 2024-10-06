
local subtitles = {"虎焰堂"}

--初始化场景和背景音乐
show_cg(subtitles)
show_stage("bg_219.png", "虎焰堂")
play_bgm("Music/舒缓_云淡风轻.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")

--初始化位置和朝向
bright_all_actors()

situ:setPos(500, 75)
situ:face_right()
qiliuge:setPos(800, 75)
qiliuge:face_left()

qiliuge:say("目前来看，我们虎焰门在掌门的耕耘带领下，江湖地位水涨船高，日益稳固。")
situ:say("唉，这又如何，我一桩心事未了，父亲母亲的大仇未报……甚至是连一点蛛丝马迹都未寻得。")
qiliuge:say("这夜鸦神秘莫测，世上尽无一人知晓他是何方神圣，更别说寻他踪迹了。")
situ:say("是啊……每次刚摸到一点羽翼，又像躲入乌云之中失去了音讯，唉……这世上怎会有如此神秘之人。")
qiliuge:say("不过……随着我们在在息风谷的势力越来越大，江湖人士对虎焰门多生了许多敬佩和服从，最近倒是打听到了不少重要消息。")
situ:jump()
situ:say("哦？有什么消息？")
qiliuge:say("夜鸦组织的几颗“牙”都是有一技超常的绝顶高手，他们各司其职潜伏在江湖各处。")
qiliuge:say("而他们三次灭门应该是在寻找什么，但具体是在找什么现在还没有明确答案。")
situ:shake()
situ:flip()
situ:say("看来不把息风谷这地毡掀起，是无法找到夜鸦的藏身之处了。")
qiliuge:say("但……近日我们所得到的消息，倒是打听出一人与这夜鸦有联系。")
situ:flip()
situ:say("谁？")
qiliuge:say("江湖传言……这息风谷有唯一的一人曾与夜鸦交过手")
qiliuge:say("后来此人命令手下和夜鸦彻底划清界限，凡是夜鸦灭掉的或盯上的门派，都不许去占据，甚至不许踏足。")

situ:say("这是与夜鸦达成协议还是……")
qiliuge:say("这江湖之中无人知晓，不知是从夜鸦手上吃了亏，还是达成了协议…")
qiliuge:say("只是后来别的门派担心受牵连也如此效仿，从此夜鸦一词也成了江湖忌讳。")
situ:jump()
situ:say("六哥口中的门派是……圣剑门？！")

qiliuge:say("不错，这个唯一与夜鸦有联系的人，就是圣剑门执剑人，闭关修炼多年未出山的息风谷第一高手，百里烟波。")
situ:say("百里烟波神龙见首不见尾，圣剑门四大剑阁守卫森严，看来想从他们嘴中知道点什么，有得一番苦战了。")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成夜鸦的踪迹")
light_scene(0.25)
