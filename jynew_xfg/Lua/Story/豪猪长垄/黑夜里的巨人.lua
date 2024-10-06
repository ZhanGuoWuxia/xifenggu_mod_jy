
show_stage("华丽府内.png", "??")
play_bgm("Music/密谋_夜郎.wav")
light_scene(0.2)

local jing = actor("鲸")
local hemeng = actor("何猛")

--初始化位置和朝向
bright_all_actors()
jing:setOverrideName("强壮的黑衣人")
jing:setPos(2500, 75)
jing:face_left()
hemeng:setPos(1100, 75)
hemeng:face_right()

wait_twn(jing:movetoX(1400, 2500), hemeng:offsetX(-100), hemeng:shake(), hemeng:daze())

hemeng:say("是…是你？真的是你？")
jing:say("废物就是废物。")
hemeng:say("你为何要在此时出现？")
jing:say("你不过是我遗弃在世间的泥沼，即便毁灭，也应当是在我手中。")
hemeng:say("我早已被你毁得体无完肤，我如今的模样，都是拜你所赐！")
jing:say("没有我，你连今日的苟活都不可得。")
hemeng:say("这样的活，不如像昆虫一般安静地死去。")
jing:say("你还是怨恨我。")
hemeng:say("那已不仅仅是怨恨，每个夜晚，那些年的虐待如影随形，记忆深入骨髓，让我血液沸腾，只有抓住那些女子的衣襟和玉臂，我才能稍得安宁。")
jing:say("如今虎焰门已灭豪猪长垄，你成了无依无靠的废物，今后的夜晚，你又将如何度过？")
hemeng:say("你怎么什么都知道。")
jing:say("你不过是我脚下的一滩烂泥。")
hemeng:say("求……求求你！大哥！求你杀了我吧……")
jing:say("杀你？你还不配！这个你收着，仔细养着你这条贱命，我还有别的用处……")
hemeng:say("这是……莫非是飞星云顶的那个——")
jing:say("哼，你倒也识货！")
hemeng:say("我……我一定不会再让大哥失望了……")
jing:say("虎焰门……便是动了我的猪狗，那也是要付出代价的！")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成黑夜里的巨人")
light_scene(0.25)
