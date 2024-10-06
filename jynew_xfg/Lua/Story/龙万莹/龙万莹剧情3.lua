
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

wait_twn(situ:movetoX(800), situ:daze())

npc:say("掌门大驾光临，可是还想聆听我的故事？")
situ:say("那日提到，为保宋兄平安，夫人究竟做了何事？")
npc:say("我担心东方骤雨会因此事不悦，所以瞒着他，独自前往了鹤岭门。")
situ:say("夫人一人前往，岂非危险重重？")
npc:say("为了洗清冤屈，查明真相，我顾不得许多。况且，我已是龙湾门的掌门夫人，鹤岭门总该给我几分薄面。")
situ:say("确实如此。")
npc:say("我直接找到了鹤岭门右使韩恭，告诉他铁驴子并非我和宋郎所杀，而是两个书生下的手。")
situ:say("韩恭信了你的话？")
npc:say("他并不相信，一口咬定是我们杀了铁驴子，还将我绑了起来，要以死谢罪。")
situ:say("夫人这可是自投罗网了？")
npc:say("就在韩恭要对我下手之际，新任鹤岭门掌门西门坡出现了，他救了我一命。")
situ:say("原来西门坡对夫人动了心。")
npc:say("这个，我也有所察觉。那晚，我留宿在西门坡那里，他答应保我安全回到龙湾门，并承诺鹤岭门不再追究食为鲜的事。")
situ:say("看来夫人果然魅力非凡。")
npc:say("哎…那次回来之后，我就有了身孕。")
situ:say("东方…豚？！")
npc:say("嗯…")
hide_all_stage_bubble()
wait_twn(situ:flip(), situ:movetoX(-500))

change_favor_by_id("龙万莹", 1)
add_player_item("豚牙丹", 2)

black_scene(0.25)
hide_stage()
set_flag("完成龙万莹剧情3")
light_scene(0.25)
