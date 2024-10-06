show_stage("虎焰山树林.png", "虎焰山树林")
light_scene(0.2)
play_bgm("Music/豪猪恶贼.wav")

local hemeng = actor("何猛")
local panmazi = actor("潘麻子")
local situ = actor("司徒来也")

--初始化位置和朝向
bright_all_actors()
hemeng:setPos(2000, 75)
hemeng:face_left()
panmazi:setPos(2400, 75)
panmazi:face_left()
situ:setPos(500, 75)
situ:face_right()

--先一起走过去
hemeng:offsetX(-1000)
wait_twn(panmazi:offsetX(-1000), panmazi:daze())

hemeng:say("哈哈！这里的美人儿可都是老子的！")
panmazi:say("哈哈哈！老大，这次一定要把他们都抓回去。")
situ:say("豪猪崽子们，还真以为我虎焰门没人了是吧。")

black_scene(0.25)
hide_stage()
set_flag_int("被豪猪长垄攻打阵型", 3)
set_flag("完成被豪猪长垄攻打已被占两个据点")
light_scene(0.25)
