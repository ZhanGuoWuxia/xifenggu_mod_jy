
show_stage("bg_174.png", "豪猪寨")
play_bgm("Music/舒缓_云淡风轻.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("汤白牛")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(900), situ:daze())

situ:say("白牛？如何在这里？看着还闷闷不乐的，有心事？")
npc:say("掌门，你说我是不是很讨人厌呀。")
situ:say("怎么会？是有谁欺负你了？敢欺负到咱们虎焰门头上，我去为你评理！")
npc:say("没有没有，是先前我做了好些点心给阿姊，可阿姊似乎不开心。")
situ:say("为什么？你做的那点心我也尝了，挺好吃的呀！")
npc:say("阿姊也说挺好吃的。")
situ:say("那是为了什么？")
npc:say("阿姊吃着点心眼圈便红了。她说我辛苦为她做这个，可她却没法为我做什么。")
situ:say("原来是这样啊。白牛，你阿姊她只是关心你呀！")
npc:say("可我也不是小孩子了，却一直学不会本事，还总是让阿姊为我操心。")
situ:say("难道，你之前想要学功夫、当大侠，竟是为了这个？")
npc:say("是啊！我现在功夫还不行，可我会努力保护阿姊，不让她被人欺负！")
situ:say("白牛放心！只要你们姐弟在虎焰门一天，虎焰门上上下下一定护你们周全！")

hide_all_stage_bubble()

change_favor_by_id("汤白牛", 1)

black_scene(0.25)
hide_stage()
set_flag("完成汤白牛剧情5")
light_scene(0.25)
