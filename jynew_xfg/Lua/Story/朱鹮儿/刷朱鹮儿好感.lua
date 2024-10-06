
show_stage("禁地.png", "训练场")
play_bgm("Music/密谋_夜郎.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("朱鹮儿")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1250, 75)
situ:face_right()
npc:face_right()

wait_twn(situ:movetoX(750), situ:daze())

stage_narration("朱鹮儿在练武场练习射箭。")
situ:say("鹮儿姑娘，你的箭术这么好，是不是想射下天上的月亮啊？")
npc:flip()
stage_narration("朱鹮儿白了一眼，故意拉弓瞄准。")
npc:spring_scale(1.5, 1.03, 1.03)
npc:say("如果你是月亮，我就射下来看看。")
situ:say("哎呀，那我可得小心了，别被你的箭射中了。")
npc:say("你敢再胡说，我就真的射了！")
situ:say("好了好了，我投降，女侠手下留情。")
npc:say("知道怕了吧，以后说话要小心。")
situ:say("不过，如果我是月亮，你会不会为了我，射下整个星空？")
npc:say("你……你太油嘴滑舌了！")

hide_all_stage_bubble()

change_favor_by_id("朱鹮儿", 1)
add_player_item("苍狼丹", 1)

black_scene(0.25)
hide_stage()
light_scene(0.25)
