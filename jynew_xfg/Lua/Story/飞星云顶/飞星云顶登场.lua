
show_stage("门派宫殿.png", "飞星云顶")
play_bgm("Music/.mp3", 0.1)
light_scene(0.2)

local shibing = actor("石冰")

--初始化位置和朝向
bright_all_actors()

shibing:setPos(500, 75)
shibing:face_right()

shibing:say("虎焰门竟也……")
shibing:say("是我……是我害了他……")
shibing:say("那个人……还有虎焰门……全都是我害的……")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成飞星云顶登场")
light_scene(0.25)
