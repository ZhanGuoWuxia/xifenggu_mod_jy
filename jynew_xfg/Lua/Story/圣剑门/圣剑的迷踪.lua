local subtitles = {"观剑阁"}

--初始化场景和背景音乐
show_cg(subtitles)
show_stage("温泉.png", "观剑阁")
play_bgm("Music/抉择_一念之间.wav", 0.1)
light_scene(0.2)

local xiaoyaner = actor("小燕儿")
local wanglong = actor("王珑")

--初始化位置和朝向
bright_all_actors()

xiaoyaner:setPos(500, 30)
xiaoyaner:face_right()
wanglong:setPos(800, 75)
wanglong:face_right()

xiaoyaner:say("主人，小燕儿有一个疑问，为何磨剑、抚剑、亮剑三阁成日长袖善舞招兵买马。主人却焚香沐浴，煎茶品茗，只坐观北方雪景？。")
wanglong:say("那是他们的任务，而观剑阁另有观剑阁的任务。")
xiaoyaner:shake()
xiaoyaner:say("主人所言，可是寻找遗落的腾云圣剑？")

wanglong:say("不错，执剑人命四大阁主乘乱扩张，可我觉得，寻找到那把圣剑才是其中关键。")
wanglong:say("毕竟腾云圣剑是百里大人看得比命还重，更何况圣剑门，曾与圣剑关系紧密。")

xiaoyaner:say("可也没见主人四处寻找，总是悠闲的样子，丝毫看不出那圣剑有多重要……")
xiaoyaner:say("那执剑人有说过圣剑在何处遗失？当如何去寻？")

wanglong:say("这……说不说又有什么区别，能让执剑人丢失圣剑，只怕是超脱常人的鬼神之力……")
xiaoyaner:jump()
xiaoyaner:say("原来其他阁主是劳力，而主人这算是……劳心？嘻嘻……")
wanglong:flip()
wanglong:say("哈哈哈……你倒是聪明！燕儿，哪天若我这个主人突然死了，你便做这观剑阁主吧。")
wait_twn(xiaoyaner:shake(),xiaoyaner:daze())
wait_twn(xiaoyaner:offsetY(-50),xiaoyaner:daze())
xiaoyaner:say("这……这，主人您胡说什么呢？您福大命大，怎么会突然死的，阁主是主，小燕儿永远都是伺候主人的仆！这仆怎么能做主啊！")
wanglong:say("无妨无妨，什么主啊仆的，这阁主不也是执剑人的仆？阁主也好，仆从也罢，不过每个人的命运不同罢了。")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成圣剑的迷踪")
light_scene(0.25)
