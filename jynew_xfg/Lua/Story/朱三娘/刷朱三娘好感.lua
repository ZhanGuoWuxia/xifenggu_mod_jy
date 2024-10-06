
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

situ:say("好香啊！是开饭了吗？")
npc:say("原来是掌门啊，厨房油烟重，当心呛着……")
situ:say("不碍的不碍的，哎呀，三娘真是好手艺！")
npc:say("哪里哪里，不过是些家常小菜而已……")
situ:say("家常小菜才香呀！刚从门前路过，便闻到这饭菜的香味，倒还真有些饿了。")
npc:say("哎呀，那我可得抓紧些了！还好都准备差不多了，待这个菜出锅，咱们便能开饭了。")
situ:say("哎呀！那还真是迫不及待了呢！当真是辛苦三娘了！")

hide_all_stage_bubble()

change_favor_by_id("朱三娘", 1)

local items = {"三娘的肉包", "鸡腿"}
add_player_item(table.pick_random(items), 1)

black_scene(0.25)
hide_stage()
light_scene(0.25)
