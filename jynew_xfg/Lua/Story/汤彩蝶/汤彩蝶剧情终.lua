
show_stage("bg_172.png", "选妃桥")
play_bgm("Music/舒缓_云淡风轻.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("汤彩蝶")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(900), situ:daze())

npc:say("掌门，现在有空吗？这些是我新写的手稿，还请掌门不吝赐教。")
situ:say("这……哎呀哎呀！写得真是太精彩了！")
npc:say("这还要多亏了掌门提供的那些武学典籍，如果没有它们，我文中的动作场面也不会如此生动。")
situ:say("那些典籍只是提供了一些参考，真正让故事如此吸引人的，还是神医的生花妙笔。")
npc:say("掌门过奖了。不过，在写这些故事的过程中，我倒是仔细研究了一些招式。")
situ:say("哦？是书里的那些招式吗？让我仔细看看。")
npc:say("虽然只是些想法，但不知道在实战中是否会有所帮助。")
situ:say("确实，仅仅是脑中预演，就能看出一些端倪。")
npc:say("没想到写这些话本子，竟然还能有这样的领悟，真是“无心插柳柳成荫”了。")
situ:say("神医的才华，真是让人敬佩。相信你在武学上的研究，一定能为你的故事增色不少。")

hide_all_stage_bubble()

roleId_change_affix("汤彩蝶", "彩蝶双飞", "凤栖梧")
tgr_achivement("谷中医仙")
restore_api.add_fire_point(5)

black_scene(0.25)
hide_stage()
set_flag("完成汤彩蝶剧情终")
light_scene(0.25)
