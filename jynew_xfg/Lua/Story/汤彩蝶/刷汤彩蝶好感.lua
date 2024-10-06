
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

situ:say("汤神医，原来您也在此享受片刻清闲，真是雅兴盎然。")
npc:say("掌门说笑了，不过是医治了一位远道而来的患者，归来途中在此小憩。倒是掌门亲自前来，才是让人惊喜。")
situ:say("神医日夜奔波，救死扶伤，这份辛劳我等自是看在眼里。但也要记得，身体是革命的本钱，切不可过度劳累。")
npc:say("多谢掌门挂怀，医者本分，哪里敢言辛劳。只是这江湖之中，总需要有人行走四方，为百姓解除病痛。")
situ:say("汤神医此言差矣，这江湖之中，正是有了您这样的医者仁心，才更显温暖。")
situ:say("我有一言，还望神医记在心里——若是连自己都不爱护，又怎能更好地照顾他人？")
npc:say("掌门金玉良言，彩蝶铭记在心。这江湖之路，虽险阻重重，但只要心怀善念，自当无畏前行。")

hide_all_stage_bubble()

change_favor_by_id("汤彩蝶", 1)

local items = {"金疮药", "止血丹"}
add_player_item(table.pick_random(items), 1)

black_scene(0.25)
hide_stage()
light_scene(0.25)
