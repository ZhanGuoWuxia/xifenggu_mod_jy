show_stage("bg_219.png", "虎焰堂")
light_scene(0.2)
play_bgm("Music/秋.wav")

local situ = actor("司徒来也")
local qiu = actor("秋")

--初始化位置和朝向
dark_all_actors()
situ:setPos(-400, 75)
situ:face_right()
qiu:setPos(1300, 75)
qiu:face_left()

wait_twn(situ:movetoX(900), situ:daze())

qiu:say("关关雎鸠，在河之洲，窈窕淑女，君子好逑。")
situ:say("哟，哟哟。这诗经学得挺有模有样的嘛。")
qiu:say("六哥教了很多，我这才学会了这么一小段。")
situ:say("那你理解这些诗句的含义了吗？")
qiu:say("我还不太理解，只是觉得读起来很顺耳。")
situ:say("很好，很有长进。现在和你交流起来感觉顺畅多了，哈哈哈哈。")
qiu:say("谢谢。")
situ:say("你瞧，现在不仅会背诗了，还变得有礼貌了。看来，我们这位狼少年已经逐渐融入了人类的文明世界。")

change_favor_by_id("秋", 1)

black_scene(0.25)
set_flag("完成秋剧情5")
hide_stage()
light_scene(0.25)
