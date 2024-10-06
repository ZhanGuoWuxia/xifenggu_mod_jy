show_stage("虎焰山树林.png", "虎焰山树林")
light_scene(0.2)
play_bgm("Music/豪猪恶贼.wav")

local hemeng = actor("何猛")
local panmazi = actor("潘麻子")
local situ = actor("司徒来也")

--初始化位置和朝向
bright_all_actors()
hemeng:setPos(2400, 75)
hemeng:face_left()
panmazi:setPos(2000, 75)
panmazi:face_left()
situ:setPos(500, 75)
situ:face_right()

--先一起走过去
panmazi:offsetX(-1000)
wait_twn(hemeng:offsetX(-1000), hemeng:daze())

panmazi:say("老大，上次是那小子走运。这次您亲自出马，一定可以干掉他们！")
hemeng:say("哼！且看我怎么帮你们出这口气！")
situ:say("手下败将，你还敢来？")

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag_int("被豪猪长垄攻打阵型", 1)
set_flag("完成被豪猪长垄攻打")
light_scene(0.25)
