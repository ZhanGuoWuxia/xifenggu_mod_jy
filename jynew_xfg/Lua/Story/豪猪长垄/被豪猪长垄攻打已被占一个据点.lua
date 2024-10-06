show_stage("虎焰山树林.png", "虎焰山树林")
light_scene(0.2)
play_bgm("Music/豪猪恶贼.wav")

local hemeng = actor("何猛")
local liangsheng = actor("梁胜")
local situ = actor("司徒来也")

--初始化位置和朝向
bright_all_actors()
hemeng:setPos(2000, 75)
hemeng:face_left()
liangsheng:setPos(2400, 75)
liangsheng:face_left()
situ:setPos(500, 75)
situ:face_right()

--先一起走过去
hemeng:offsetX(-1000)
wait_twn(liangsheng:offsetX(-1000), liangsheng:daze())

hemeng:say("看看这虎焰门还有没有大美人，统统都给老子绑回去！")
liangsheng:say("都抓回去孝敬老大！")
situ:say("这次不能再败了，不然虎焰门就真的完了。")

black_scene(0.25)
hide_stage()
set_flag_int("被豪猪长垄攻打阵型", 2)
set_flag("完成被豪猪长垄攻打已被占一个据点")
light_scene(0.25)
