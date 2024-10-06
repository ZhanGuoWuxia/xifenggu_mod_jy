local subtitles = {"圣剑门"}

--初始化场景和背景音乐
show_cg(subtitles)
show_stage("走廊.png", "圣剑门")
play_bgm("Music/山雨欲来风满楼.wav", 0.1)
light_scene(0.2)

--初始化角色
local situ = actor("司徒来也")
local fandaoping = actor("范道平")

--初始化位置和朝向
bright_all_actors()
situ:setPos(2500, 75)
situ:face_left()
fandaoping:setPos(-1000, 500)
fandaoping:face_right()

--剧情
wait_twn(situ:movetoX(1700),situ:daze(0))
situ:jump()
situ:say("晚辈虎焰门掌门(player:gname)请百里烟波前辈出山，晚辈有些重要之事前来讨教。")
stage_narration("刚说完就见远处一位轻功了的人飞了过来…")
hide_all_stage_bubble()

wait_twn(fandaoping:moveTo(500,75,3000),fandaoping:daze(0))
fandaoping:say("哼！")
fandaoping:say("屁的要事！连我堂堂亮剑阁主都不敢直呼执剑人尊名，你虎焰门什么东西，敢来搅扰执剑人闭关修炼！快滚快滚！")

situ:jump()
situ:say("圣剑门好不讲道理！既然如此！那休怪虎焰门无礼！")
play_sfx("Voice/Male2_Attack_2.wav")
situ:rotatetoZ(15)
situ:movetoX(700,5000)
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成点击宣战")
light_scene(0.25)
