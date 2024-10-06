
show_stage("酒香亭.png", "酒家")
play_bgm("Music/回忆.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("汤彩蝶")
local lai3 = actor("赖三")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1000, 75)
lai3:setPos(1300, 75)
situ:face_right()
npc:face_right()
lai3:face_left()

lai3:say("汤神医果然名不虚传，这手医术真是让人佩服。")
npc:say("赖三哥太过奖了，不过是些分内之事，不值一提。")
lai3:flip()
wait_twn(lai3:movetoX(3000), situ:movetoX(700), situ:daze())
situ:say("刚才那位酒香亭的伙计，已经康复如初了？真是神奇。不知汤神医可否赐教，那膏药有何奇特之处，竟能如此迅速地治愈扭伤？")
npc:flip()
npc:say("不过是寻常的膏药，只是用药上略有心得。若掌门不弃，我自当奉上。")
situ:say("汤神医若肯赐药，我这三脚猫的功夫，说不定也能更上一层楼呢！")
npc:say("哎呀……好歹也是掌门，哪里学的这些油腔滑调？")
situ:say("不过是看汤神医出诊辛苦，所以说些话逗趣儿而已，莫非冒犯神医了？")
npc:say("没有没有！掌门有这份好意，彩蝶便心领了。")
situ:say("汤神医，您这脸色确实有些不对，是不是累着了？还是天气炎热，中了暑气？可要好好休息，别累坏了身子。")
npc:say("嗯，或许是有些累了，没想到在掌门面前失态了。我这就回去休息，多谢掌门的关心。")
situ:say("汤神医，您的健康对我们来说至关重要，还请您务必保重。若是需要帮忙，尽管开口。")

hide_all_stage_bubble()

change_favor_by_id("汤彩蝶", 1)

black_scene(0.25)
hide_stage()
set_flag("完成汤彩蝶剧情1")
light_scene(0.25)
