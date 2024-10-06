
show_stage("厨房.png", "厨房")
play_bgm("[override_map]:Music/抒情_柔情似水.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("朱三娘")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(400, 75)
situ:face_right()
npc:face_left()

npc:say("掌门，不知现下可否来厨房一趟？")
hide_all_stage_bubble()
npc:flip()
npc:offsetX(700)
wait_twn(situ:movetoX(700), situ:daze())
situ:say("什么事情呀，这么神秘？")
npc:say("掌门且用心看便是了。")
situ:say("烧菜做饭？这有什么特别之处——")
--朱三娘练武中
wait_twn(npc:movetoX(1300, 4000), npc:offsetX(-300, 4000), npc:offsetX(500, 4000), npc:offsetX(300, 4000), npc:movetoX(1200, 4000), npc:daze())
stage_narration("话音未落，(player:fullname)的目光突然一凝，他看到了朱三娘在行走躲闪时的身法，以及在切菜斩肉时的力道，不禁惊叹。")
situ:say("三娘！你这行走躲闪时的身法、还有切菜斩肉时候力道……当真高明！")
npc:flip()
npc:say("掌门过奖了。")
situ:say("三娘，你莫非是受了什么武林高人的点拨？功力如何这般精进了！")
npc:say("哪里有什么武林高手？这还要多谢掌门呢。")
situ:say("跟我有什么关系？我也不记得有教过你这些啊。")
npc:say("掌门当日里说这烧菜做饭之间也能悟出些习武的道理，我便处处留心，果然如此。")
situ:say("这些……竟都是你自己悟出来的？三娘你莫非是学武的天造之才？")
npc:say("掌门说哪里话，不过是平日里多花些心思而已，期间体悟都记录在册，烦请掌门指点一二。")

hide_all_stage_bubble()

change_favor_by_id("朱三娘", 1)
restore_api.add_fire_point(5)
add_player_item("烤串", 1)

black_scene(0.25)
hide_stage()
set_flag("完成朱三娘剧情终")
tgr_achivement("美艳厨娘")
light_scene(0.25)
