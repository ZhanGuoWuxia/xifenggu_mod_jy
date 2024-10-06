
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
npc:face_right()

wait_twn(situ:movetoX(800), situ:daze())

npc:say("去骨腌制，先炸后焖，步骤没错啊，为何味道总是差些呢？")
hide_all_stage_bubble()
--切菜
wait_twn(npc:jump(50, 4, 1.2), npc:daze())
situ:say("三娘这是琢磨什么呢？")
npc:flip()
npc:say("哎呀！竟是掌门来了，瞧我，都没有察觉！")
situ:say("这厨房之中，如何还摆上笔墨纸砚了？")
npc:say("让掌门见笑了，不过是平时研究菜谱时，脑子不太灵光的，用这些帮忙记一点笔记。")
situ:say("这倒有些意思，让我也来看看。")
situ:say("咦？这圈圈点点的，又是什么？")
npc:say("那个啊，说来惭愧，我不怎么识字，就只能随便做点标记，画画圈什么的。虽然费事些，可倒也是个办法。")
situ:say("原来如此！竟还有这样的法子，三娘你还是很用心嘛！")
npc:say("无非是些小聪明，我就羡慕那些读书人，写写画画的，还有懂得好多事。")
situ:say("三娘若想读书这有何难？门中虽遭劫，可到底还是留下了不少书册。三娘可以去看，不懂的地方找我或是齐六哥都成！")
npc:say("这太好了，感谢掌门大恩大德！")
situ:say("都是小事，不必在意！何必说得这么郑重？现在门里只剩我们，都是一家人，当然要彼此相助了。")
npc:say("对掌门来说，或许是小事，可对我来说，却是十分重要的大事呀！")

hide_all_stage_bubble()

change_favor_by_id("朱三娘", 1)
add_player_item("三娘的肉包", 1)

black_scene(0.25)
hide_stage()
set_flag("完成朱三娘剧情1")
light_scene(0.25)
