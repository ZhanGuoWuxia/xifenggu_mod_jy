
show_stage("bg_174.png", "豪猪寨")
play_bgm("Music/舒缓_云淡风轻.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("汤白牛")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(900), situ:daze())

npc:say("掌门！掌门！")
situ:say("哎呀，有什么喜事儿？这么高兴？")
npc:say("掌门！我刚刚跟人切磋，赢了！用的就是掌门先前教我的那一套功夫！")
situ:say("那可当真是了不得的事情！看来你这段时间的努力没有白费！")
npc:say("是啊是啊！先前练武时受得那些伤也值了！")
situ:say("哈哈，看你如此心急！练武还是要讲究技巧，吃苦固然有的，可也要爱惜身体呀。")
npc:say("嗯嗯！我记得呢！我还记得掌门说过，要不断思索，这不？我还总结了不少关窍！")
situ:say("哦？竟有这样的事？来来来！我可要好好看看！")
stage_narration("汤白牛拿出了一本小册子，递了过来。")
npc:say("掌门，这是我最近总结的练武心得，还请掌门指点一二。")
situ:say("不错，不错！你的总结很有见地，看来你这段时间真是下了不少功夫！")
npc:say("哪里哪里，这些都是掌门教的好。我只是将掌门教给我的东西，结合自己的体会，整理了一下。")
situ:say("很好，很好！继续保持这份勤奋和思考，你的武艺定会大有长进！")
npc:say("谢谢掌门的鼓励，我一定会继续努力的！")
situ:say("好，那就加油！我相信你一定能够成为一名出色的武林高手！")
npc:say("我一定要成为当世无双的大侠，这样就能保护阿姊，也不会让阿姊担心了！")

hide_all_stage_bubble()

change_favor_by_id("汤白牛", 1)
restore_api.add_fire_point(5)

black_scene(0.25)
hide_stage()
set_flag("完成汤白牛剧情终")
tgr_achivement("憨厚弟弟")
light_scene(0.25)
