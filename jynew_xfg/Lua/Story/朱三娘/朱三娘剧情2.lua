
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

situ:say("老远就瞧见这厨房里，一会儿火一会儿烟的，三娘又做了些什么，这么热闹？")
wait_twn(npc:flip(), npc:movetoX(1100), npc:daze())
npc:say("掌门来的正好，这里有几道小菜，掌门不妨尝尝？")
situ:say("这脱骨酱鸭当真不错！肉质鲜嫩，回味无穷。")
situ:say("这是茄子？还加了蒜蓉？")
npc:say("怎么了掌门？这茄子有什么问题吗？")
situ:say("哦，没事没事，只是平日里从来也没吃过这个味道的茄子，有些惊讶而已。")
npc:say("哎呀，是我的疏忽了。因为新学了几道菜，只想着让掌门尝尝味道，却忘了掌门不怎么爱吃蒸蒜蓉。")
situ:say("我确实不怎么喜欢蒸蒜蓉，不过三娘竟然连这样的小事都记着？")
npc:say("对于我们这些平日里做饭的人来说，不光要记得这些食材怎么做好吃，怎么做不好吃，连吃饭的那些人各自爱吃什么，不爱吃什么，可都是马虎不得的。")
situ:say("竟然是这样。")
npc:say("不瞒掌门，对于做饭这行，我其实也没什么天分，因此更需要处处留意这些，努力让自己做得好些，进而更好些。")
situ:say("所以你才想要学习读书识字？是为了更好地研究菜谱？")
npc:say("掌门还记得呢？正是如此。")
situ:say("唉，连你都如此努力坚持，我若是在习武练功方面懈怠了，那可真是不配做这虎焰门的掌门了。")
npc:say("哎呀，掌门哪里的话。")

hide_all_stage_bubble()

change_favor_by_id("朱三娘", 1)
add_player_item("肉排", 1)

black_scene(0.25)
hide_stage()
set_flag("完成朱三娘剧情2")
light_scene(0.25)
