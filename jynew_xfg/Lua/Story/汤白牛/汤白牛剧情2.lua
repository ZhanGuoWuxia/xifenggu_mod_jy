
show_stage("酒香亭.png", "酒家")
play_bgm("Music/回忆.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local lai3 = actor("赖三")
local tangbainiu = actor("汤白牛")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
situ:face_right()
tangbainiu:setPos(1000, 75)
tangbainiu:face_right()
lai3:setPos(1300, 75)
lai3:face_left()

lai3:say("汤小爷，话不能这么说，我不过是陈述一下江湖上的传闻，你怎么能说我瞎说呢？")
tangbainiu:say("你就是瞎说！你就是瞎说！")
wait_twn(situ:movetoX(700), situ:daze())
situ:say("不过是在酒香亭吃顿饭的功夫，怎么还吵起来了？")
lai3:say("(player:fname)掌门，您瞧瞧，汤小爷这脾气，汤小爷算是油盐不进。")
situ:say("白牛，你先别急，告诉我到底发生了什么事？")
tangbainiu:flip()
tangbainiu:say("他说谎！他骗人！")
lai3:say("这怎么能是骗人呢？话可不能乱说呀！")
situ:say("别急别急，有话好好说，到底怎么了？")
tangbainiu:say("我问他这江湖中哪家是最厉害的门派！他却说瞎话！")
lai3:say("我哪有乱说了？")
tangbainiu:say("就是乱说！最厉害的门派怎么可能不是虎焰门？")
situ:say("原来是为了这样的事啊。")
tangbainiu:say("掌门，你说虎焰门是不是最厉害的门派？他是不是瞧不起我们虎焰门？")
situ:say("白牛，你放心！我一定会让虎焰门变成这江湖中最厉害的门派！")

hide_all_stage_bubble()

change_favor_by_id("汤白牛", 1)

black_scene(0.25)
hide_stage()
set_flag("完成汤白牛剧情2")
light_scene(0.25)
