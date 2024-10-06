
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

situ:say("哎呦！汤神医从哪儿寻得的这些个蜜丸子？闻着便香甜可口！")
npc:say("胡闹，这药也是混吃的？")
situ:say("这是药？别蒙我，药不都是些又酸又涩的苦汤子？")
npc:say("掌门可听过“良药苦口”？就可知这药虽苦，却治病呀。")
situ:say("为何你这几颗丸子便是甜的？汤神医莫要偏心，日后我也要向神医讨些甜药！")
npc:say("好好好，待我试了药理药性，定给掌门多配些甜药！")
situ:say("汤神医亲自尝试这些药方，难道就不怕万一？我听说很多药材都有毒性，这“是药三分毒”的说法可是流传已久。")
npc:say("身为医者，自当以身试药，了解药性。若连自己都不敢尝试，又怎能确保患者的安全？")
npc:say("医者，尝百草救万世，若自己没有“苦尽”的觉悟，如何能换伤患“甘来”呢？")
situ:say("汤神医这份仁心仁术，实在让人佩服。我若是患者，能遇到您这样的医者，那是三生有幸。")
npc:say("掌门过誉了，我只是尽我本分。若掌门有需要，汤彩蝶自当尽力。")

hide_all_stage_bubble()

change_favor_by_id("汤彩蝶", 1)
roleId_change_affix("汤彩蝶", "似桂如兰", "温柔和顺")

black_scene(0.25)
hide_stage()
set_flag("完成汤彩蝶剧情2")
light_scene(0.25)
