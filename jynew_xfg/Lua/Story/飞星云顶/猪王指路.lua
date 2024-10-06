
show_stage("门派宫殿.png", "飞星云顶")
play_bgm("Music/.mp3", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local hemeng = actor("何猛")

--初始化位置和朝向
bright_all_actors()

situ:setPos(500, 75)
situ:face_right()
hemeng:setPos(800, 75)
hemeng:face_left()

hemeng:say("呵呵呵呵……哈哈哈哈……")
situ:say("怎么了？豪猪王也如此疯癫了吗？")
hemeng:say("我万万没想到！我何猛居然会两次被虎焰门弄得无家可归！哈哈哈哈哈哈……")
situ:say("你的确是疯癫了，不过你说的也不错。")
hemeng:say("真是没想到，即便是连成了这云蝶剑法还是不敌你手，枉我付出了这么多心思！")
situ:say("你心思不正，练那些邪术，自然得不偿失。")
hemeng:say("哼，你倒自诩正道，却也未必无敌！这息风谷还有一人，你绝非对手。")
situ:say("你口中之人是你那巨人哥哥吗？")
hemeng:say("不不不！不要提他！")
situ:say("那是？")
hemeng:say("我说的那人，我也只有一面之缘。他一头白发，身形矫健，在一个幽暗的山谷中，远远地见一掌挥出，便直接震碎十头野狼！")
situ:say("那个人，你是在哪个山谷见到的？")
hemeng:say("如若我没记错的话，是在鹤汀崖后面的山谷中……喂，你去哪？")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成猪王指路")
light_scene(0.25)
