
show_stage("bg_174.png", "豪猪寨")
play_bgm("Music/舒缓_云淡风轻.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("汤白牛")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-600, 75)
npc:setPos(-300, 75)
situ:face_right()
npc:face_right()

npc:movetoX(900)
wait_twn(situ:movetoX(600), situ:daze())

situ:say("白牛，你这是怎么了？这么急匆匆地拉着我去哪儿？")
npc:say("掌门，你快看那边！")
stage_narration("汤白牛指着前方的摊位，只见摊位上写着：“七夕乞巧，凡女客皆送巧果一盘。”")
npc:flip()
npc:say("掌门，这巧果是什么东西？好吃不好吃？")
situ:say("这巧果嘛……哎呀，你这个问题问倒我了。这东西一般是女子过七夕节时吃的，我一个大男人，确实不太清楚。")
npc:say("竟然还有掌门不知道的东西？")
situ:say("是啊，我曾经看到朱三娘做过一些，看起来小巧玲珑，挺精致的。")
npc:say("那这巧果要多少钱啊？")
situ:say("这个我就不清楚了，看这样子，应该是店家为了吸引顾客的。至于卖不卖给我们，那就难说了。")
npc:say("不管了，不管多少钱，我今儿一定要买一些回去！")
situ:say("你买这个做什么？")
npc:say("当然是送人啊，这不是给女子吃的吗？")
situ:say("哦？这么说，你有心上人了？可不能欺负人家女孩子。")
npc:say("掌门，您别开玩笑了。大丈夫志在四方，我哪儿有心思成天想这些。我是想买回去给我阿姊，她最喜欢这些小巧可口的吃食了。")
situ:say("原来是这样，那你可得好好选一选，给你阿姊一个惊喜。")
hide_all_stage_bubble()

npc:flip()
npc:movetoX(2500)
wait_twn(situ:movetoX(2500))


change_favor_by_id("汤白牛", 1)

black_scene(0.25)
hide_stage()
set_flag("完成汤白牛剧情3")
light_scene(0.25)
