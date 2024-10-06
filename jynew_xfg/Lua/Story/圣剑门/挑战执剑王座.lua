local subtitles = {"圣剑门"}

--初始化场景和背景音乐
show_cg(subtitles)
show_stage("走廊.png", "圣剑门")
play_bgm("Music/热血_侠肝义胆高潮.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local wanglong = actor("王珑")
local langzigui = actor("朗自归")
local jiyeman = actor("姬野蔓")
local fandaoping = actor("范道平")

--初始化位置和朝向
bright_all_actors()

situ:setPos(2500, 75)
situ:face_left()


wanglong:setPos(200, 75)
wanglong:face_right()
langzigui:setPos(500, 75)
langzigui:face_left()
jiyeman:setPos(750, 75)
jiyeman:face_left()
fandaoping:setPos(2500, 400)
fandaoping:face_left()


--这里我觉得需要补充一点剧情，因为是接攻下亮剑阁的剧情，可以亮剑阁主慌慌张张逃过来
wait_twn(fandaoping:moveTo(1000,75,3500),fandaoping:daze())
wanglong:say("范阁主怎么如此慌张")
fandaoping:shake()
fandaoping:say("那小子……")
stage_narration("还未说完就见…")

wait_twn(situ:movetoX(1750),situ:daze())
langzigui:flip()
jiyeman:flip()
fandaoping:flip()
situ:jump()
situ:say("百里烟波，快快出来告诉我夜鸦踪迹，这般躲躲藏藏充当这息风谷第一神秘人，莫非你就是夜鸦？！")


fandaoping:jump()
shake_stage()
fandaoping:say("不知天高地厚的小子！这圣剑门岂是你无法无天之地？！")
jiyeman:jump()
jiyeman:say("扰百里大人修炼，这后果你可承担不起。")
wanglong:say("是啊，有什么事情同我们商量，不必惊扰执剑大人。")
situ:jump()
situ:say("那我今日非要叨扰了这清净，你们能奈我何？！")
langzigui:say("那就不说废话了！")
situ:jump()
situ:say("今日不见这百里烟波，别说四大阁主，便是四大金刚也要杀个片甲不留！")
langzigui:jump()
langzigui:say("今日虎焰狂徒侵入执剑圣地，触我门宗之大逆！亮抚观磨！以血护主！全力应战！")
wanglong:say("以血护主！")
jiyeman:say("全力应战！")
fandaoping:say("干死虎焰门这帮不识抬举的杂碎！")
situ:jump()
situ:say("虎焰门听令！如虎无畏！如焰长明！所到之处！诸邪不兴！")
hide_all_stage_bubble()
situ:rotatetoZ(20,100)
situ:movetoX(1200,5000)
situ:rotatetoZ(-20,100)

black_scene(0.25)
hide_stage()
set_flag("完成挑战执剑王座")
light_scene(0.25)
