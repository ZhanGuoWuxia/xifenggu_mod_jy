show_stage("虎焰山树林.png", "虎焰山树林")
light_scene(0.2)
play_bgm("Music/豪猪恶贼.wav")

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
local liangsheng = actor("梁胜")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
situ:face_right()
qiliuge:setPos(-700, 75)
qiliuge:face_right()
liangsheng:setPos(1800, 75)
liangsheng:face_right()

--先一起走过去
situ:movetoX(1100)
wait_twn(qiliuge:movetoX(800), qiliuge:daze())

situ:say("豪猪长垄之中，女子众多，却是何故？")
qiliuge:say("豪猪长垄的头领何猛，他吩咐手下，四处搜罗女子，也不知是想做什么伤天害理之事。")
situ:say("这么多姑娘，他倒是有些手段。")
qiliuge:say("他手段诡异，或以甜言蜜语诱之，或以金钱财物诱之，若再不从，便用迷药，甚至强行绑缚，不知有多少无辜女子受害。")
situ:emotion("NaoHuo")
situ:say("这等行径，天理难容！")
wait_twn(liangsheng:flip(), liangsheng:movetoX(1400), liangsheng:daze())
qiliuge:say("小心些，来者是豪猪长垄的三当家梁胜。先前总叫嚣自己叫“毒眼儿”，如今求仁得仁，当真变成“独眼儿”了。")
situ:say("上次废了他一只眼睛，如今还敢来？")
qiliuge:say("可不是？他助纣为虐，掳人子女，姿色出众者献与何猛，寻常之人便任其处置。")
liangsheng:say("狂妄之徒，看我如何收拾你！")
situ:emotion()
situ:say("速速放掉所有女子，否则我(player:fullname)今日便要你的狗命！")
liangsheng:say("哼，你们几个小角色，也敢在我面前嚣张！")

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag_int("攻打豪猪长垄阵型", 1)
set_flag("完成攻打豪猪长垄")
light_scene(0.25)
