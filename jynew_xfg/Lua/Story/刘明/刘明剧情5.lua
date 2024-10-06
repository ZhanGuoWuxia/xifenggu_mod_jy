show_stage("厨房.png", "厨房")
play_bgm("Music/日常_烟火人间.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local liuming = actor("刘明")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
liuming:setPos(1300, 75)
situ:face_right()
liuming:face_left()

wait_twn(situ:movetoX(800), situ:daze())

liuming:say("掌门，我悟到了！")
situ:say("悟到什么了？")
liuming:say("刀剑和火钳是一样的！道理都是一样的！")
situ:say("怎么说？")
liuming:say("小时候，俺一直以为用的力气越大，作用就越大，后来俺师父告诉我，如果做什么事都只靠力量的话，那每个人都只需要练臂力了。")
situ:say("类似这样的话，我父亲似乎也说过。")
liuming:say("对吧，掌门！火钳的使用中有个要领，第一是使力的点和火钳的方向之间的关系，第二是火钳插入柴火的位置。这个，和刀剑的道理好像异曲同工啊！")
situ:say("你这么说，好像是有道理啊。使力出刀的角度，和击中对手的位置，这也是刀法的要领。")
liuming:say("我最近用木桩子进行练习，似乎开窍了，虽然说不清道不明，但是我已经能单手用火钳轻易地刺裂粗壮的木桩了。你看！")
situ:say("哈哈哈！我可真没看错人啊，老刘，你就是个习武的天才！")
liuming:say("掌门先别夸我，看我在战场上施展施展吧！")
situ:say("好，我就等着看你如何在战场上大放异彩，让虎焰门的火钳成为江湖中一道独特的风景线！")
hide_all_stage_bubble()

change_favor_by_id("刘明", 1)

black_scene(0.25)
hide_stage()
set_flag("完成刘明剧情5")
light_scene(0.25)
