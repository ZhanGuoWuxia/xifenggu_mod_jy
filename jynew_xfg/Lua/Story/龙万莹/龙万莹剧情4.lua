
show_stage("龙万莹的房间.png", "龙万莹的房间")
play_bgm("Music/回忆.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("龙万莹")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1100, 75)
situ:face_right()
npc:face_left()

situ:movetoX(800)

play_sfx("Skills/Wuxia/blade_2.mp3")
wait_twn(npc:movetoX(500, 4000), npc:offsetX(-300, 4000), npc:offsetX(1000, 4000), npc:offsetX(300, 4000), npc:movetoX(1200, 4000), situ:daze())
situ:say("夫人，是在练功吗？")
npc:say("江湖之中危机四伏，我一弱女子要想立足，自然不能懈怠了武艺。")
npc:say("何况虎焰门乃武学圣地，若不勤加修炼，又怎好在(player:fname)掌门这里白吃白喝呢。")
situ:say("夫人这些年来跟随东方骤雨这样的武林高手，定是学得了不少上乘武学。")
npc:say("初嫁东方骤雨时，我尚且是个对武功一窍不通的女子。这些年来，他确实传授了我许多招式，但内功心法，都是我自己摸索而得。")
situ:say("夫人也算得上是武学奇才了。")
npc:say("说来也怪，每诞下一子，我的内功似乎都会有所突破。")
situ:say("竟有如此奇事？")
npc:say("确实如此，我也难以解释。")
situ:say("夫人育有三子，也就是说，内功应该经历了三次飞跃。")
npc:say("正是如此。")
situ:say("东方鲨是宋兄之子，东方豚是西门坡之子，那么只有东方狸是东方骤雨的骨肉了。")
npc:say("……")
situ:say("东方狸也不是？")
npc:say("在东方豚出生后，我曾经历过一件极为诡异之事，此事我从未对人提起。")
npc:say("有一天，我在人群中，竟然看到了那个人的身影。")
situ:say("哪个人？")
npc:say("就是在食为鲜里，杀死铁驴子的那个瘦书生……")

hide_all_stage_bubble()

change_favor_by_id("龙万莹", 1)
add_player_item("武学札记", 5)

black_scene(0.25)
hide_stage()
set_flag("完成龙万莹剧情4")
light_scene(0.25)
