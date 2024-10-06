
show_stage("百草清涧.png", "下午, 虎焰门郊外")
play_bgm("Music/西门香.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("西门香")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1200, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(900), npc:offsetX(-100), situ:shake(), npc:daze())
stage_narration("阳光和煦，微风不燥，西门香独自一人在郊外挥剑起舞。")
npc:say("(player:fullname)，你来得正好，快告诉我，虎焰刀法有何独到之处？")
situ:say("虎焰刀法，刚猛有力，招式简练，全然以虎之神态为本，劈、扫、斩，威猛无比。每一刀都如猛虎下山，刚猛直接，力求一击必中。")
npc:say("这与我派的鹤舞霜华剑截然不同，剑走轻灵，阴柔多变，以鹤之舞动为形，刺、削、挑、点，迅如疾风。如鹤舞九天，变化莫测，攻守兼备。")
situ:say("听你这么一说，我忽然有所领悟——“虎形劲猛，鹤形灵动，双形合一”，你使剑法，我使刀法，或许能相辅相成，相得益彰。")
npc:say("不错，不过兵法有云：“兵无常势，水无常形”，若对手不明我等刀剑之别，岂不是无招胜有招？")
npc:say("师傅曾教导我，剑法之秘诀，不在剑尖所指，而在心中所向，在于精神之凝聚。")
situ:say("心中所向？这是何意？")
npc:say("正是。无论是刀是剑，修炼至高境界，都需要心神合一，意随心动，方能进入武学的化境。")

play_bgm("Music/决心_仗剑天涯.wav", 0.1)

play_sfx("Skills/Wuxia/blade_2.mp3")
npc:spring_scale(1.5, 1.1, 1.1)
situ:shake()
situ:say("香儿，这一剑为何如此疾劲、精准、有力？我从未剑你使过。")
npc:jump()
npc:say("是了，正是这样！原来奥秘在这里！")

stage_narration("西门香、(player:fullname) 领悟了<color=red>虎啸鹤舞</color>！")

roleId_change_affix("西门香", "虎鹤无形_西门香", "虎啸鹤舞_西门香")
roleId_change_affix("司徒来也", "虎鹤无形_司徒来也", "虎啸鹤舞_司徒来也")

restore_api.add_fire_point(5)

black_scene(0.25)
hide_stage()
set_flag("完成西门香剧情终")
tgr_achivement("虎鹤无形")
light_scene(0.25)
