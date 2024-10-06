
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
lai3:face_left()
lai3:setPos(1300, 75)

lai3:say("西门坡洒东方雨，南宫燕惊(player:fname)雷，妙手书生田中去，百里烟波朗自归。")
lai3:say("江湖中当年叱咤风云的几位高人，如今当真是四散各处了！")
tangbainiu:say("然后呢？然后呢？再讲些！再讲些！别这么磨磨唧唧的！")
lai3:say("爷……不是小的卖关子，是小的当真只知道这些了。")
wait_twn(situ:movetoX(600), situ:daze())
situ:say("兴致很高啊，这是听说书呢？我也来听听！")
lai3:say("这位爷可别打趣了，小的还要忙，几位慢聊……")
hide_all_stage_bubble()
lai3:flip()
wait_twn(lai3:movetoX(3000))
tangbainiu:flip()
tangbainiu:say("掌门来得正好！掌门可一定知道不少江湖中的高人！")
situ:say("知道是知道一些，不过为什么会对这些好奇？")
tangbainiu:say("我也想做个武林高手，在江湖上行侠仗义！")
situ:say("有志者事竟成，只要你有心，总有一天会实现你的梦想。")
tangbainiu:say("谢谢掌门！我会努力的！")

hide_all_stage_bubble()

change_favor_by_id("汤白牛", 1)
add_player_item("灵龟丹", 1)

black_scene(0.25)
hide_stage()
light_scene(0.25)
