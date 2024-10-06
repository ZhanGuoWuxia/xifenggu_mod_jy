
show_stage("厨房.png", "厨房")
play_bgm("[override_map]:Music/抒情_柔情似水.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("朱三娘")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(800), situ:daze())

npc:say("这年节下事情最多，掌门也能来帮忙当真难得。")
situ:say("哪里哪里，想着年下各处事情一定都不少，再说大家伙一同忙年也热闹些。")
npc:say("厨房里节庆用的吃食，若我自己一个人打整，还当真有些费劲呢。")
situ:say("三娘别谦虚了，我看着这厨房里里外外，不都井井有条的？")
npc:say("掌门过奖了。")
situ:say("才没有！就说这十几斤面吧，和面擀面这一套功夫下来，当真行云流水一般啊。")
npc:say("什么功夫呀，不过就是熟能生巧而已。")
situ:say("可诸般种种岂非都要“熟能生巧”？就说这习武，反复练习，但求“手熟”而已。")
npc:say("若如掌门所言，似乎确是如此。")
situ:say("用烧菜的法子去练武，三娘不妨试试？")
npc:say("哎呀，掌门可别说笑了。")
situ:say("有道是“三百六十行，行行出状元”，。三娘若有心，不妨一试")
npc:say("好，那我就试试看，说不定真能从厨艺中悟出武艺的真谛")

hide_all_stage_bubble()

change_favor_by_id("朱三娘", 1)
add_player_item("三娘的肉包", 1)
add_player_item("烧鱼", 1)

black_scene(0.25)
hide_stage()
set_flag("完成朱三娘剧情5")
light_scene(0.25)
