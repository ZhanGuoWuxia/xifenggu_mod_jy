
show_stage("仙竹门.png", "仙竹门")
play_bgm("Music/回忆.wav")
light_scene(0.2)

local alasuo = actor("阿拉索")
local nangongyan = actor("南宫燕")

--初始化位置和朝向
bright_all_actors()

alasuo:setPos(700, 75)
alasuo:face_right()
nangongyan:setPos(1100, 75)
nangongyan:face_left()

alasuo:say("主人，您可是在为南宫紫姑娘的离世而哀伤？")
nangongyan:say("笑话！我南宫燕岂会为那个背叛家族的女人流下半滴泪来。")
alasuo:say("但属下见主人眼角，泪光闪烁，似是心中有所不忍。")
nangongyan:say("妄言！你这贱奴，再敢多言，小心我割你舌头！我与她之间，情同陌路，何来感情可言。")
alasuo:say("可南宫紫姑娘，毕竟是主人您的亲妹妹啊。")
nangongyan:say("血浓于水又如何？骨焚万颗尘，魂烬一缕烟，这就是南宫紫一生依附男人的结果。")
alasuo:say("那在主人眼中，世间男子都是如此不可靠？")
nangongyan:say("你也是男子，你以为如何？")
alasuo:say("主人英明神武，世间无人能及。属下得以侍奉左右，已是此生无上的荣幸。")
hide_all_stage_bubble()
unlock_menpai("仙竹门", true)

black_scene(0.25)
hide_stage()
set_flag("完成仙竹门登场")
light_scene(0.25)
