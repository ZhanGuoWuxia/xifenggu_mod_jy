show_stage("龙湾门大堂.png", "龙湾门大堂")
set_bg_mat("ImgPaperFold")
play_bgm("Music/密谋_夜郎.wav")
light_scene(0.2)

local longwanying = actor("龙万莹")
local laosong = actor("老宋")
local dongfangsha = actor("东方鲨")

set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
longwanying:setPos(900, 75)
longwanying:face_left()
laosong:setPos(1400, -500)
laosong:face_left()
dongfangsha:setPos(300, -500)
dongfangsha:face_right()

--环视四周
for i = 1, 3 do
  wait_twn(longwanying:flip(0.2), longwanying:daze(), longwanying:say("宋郎——鲨儿——"))
end

--一起跳出来
wait_twn(laosong:jumpTo(1200, 75), dongfangsha:jumpTo(600, 75), longwanying:standfront())
longwanying:say("宋郎，速速召集兄弟姐妹，今日便是我们揭竿而起之时。")
laosong:say("莹儿，这一天，我们等得太久。")
dongfangsha:say("娘！你们这是……")
longwanying:flip()
longwanying:say("鲨儿，你长大成人，是该知道真相的时候了。多年前，食为鲜一门因东方骤雨陷害，满门遭受不幸。宋郎被迫背井离乡，而我已有身孕……")
laosong:say("而你，被迫嫁给东方骤雨，生下了鲨儿。")
dongfangsha:say("这……这怎么可能？")
longwanying:say("鲨儿，你其实是我和宋郎的孩子。")
dongfangsha:say("娘……我……我一时不知道该怎么接受……")
longwanying:say("鲨儿，你只用知道，我所做的一切，都是为了我们一家人。")
laosong:say("孩子，是时候揭开真相了。让我们一起重建食为鲜，反抗这命运的不公。")

hide_all_stage_bubble()
hide_stage()
light_scene(0.25)

if join_menpai("龙万莹", "食为鲜") then
  pop_tip("<color=#ff7a00>龙万莹</color>加入了食为鲜")
end

if join_menpai("东方鲨", "食为鲜") then
  pop_tip("<color=#ff7a00>东方鲨</color>加入了食为鲜")
end

if join_menpai("老宋", "食为鲜") then
  pop_tip("<color=#ff7a00>老宋</color>加入了食为鲜")
  play_sfx("Tip/Tip1.wav")
end

unlock_menpai("食为鲜")
set_menpai_leader("食为鲜", "龙万莹")

wait_for_seconds(3)

set_flag("完成龙万莹密谋起义")
