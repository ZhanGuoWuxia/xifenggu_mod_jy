local subtitles = {"暮霭⼭庄"}

--初始化场景和背景音乐
show_cg(subtitles)
show_stage("bg_15.png", "暮霭⼭庄")
set_bg_mat("ImgPaperFold")
light_scene(0.2)
play_bgm("Music/抒情_柔情似水.wav", 0.2)

--初始化人物
local subanjian = actor("苏半见")
local baishiba = actor("白十八")
--初始化位置和朝向
dark_all_actors()
subanjian:setPos(2500, 75)
subanjian:face_left()
baishiba:setPos(2850, 75)
baishiba:face_left()


--剧情
baishiba:movetoX(1300)
wait_twn(subanjian:movetoX(800),subanjian:daze())
subanjian:shake()
wait_twn(play_sfx("Voice/Male1_Laugh_1.wav"),subanjian:say("哈哈哈，这样好的东西酿酒喝，⼀定甚是美味。"))
baishiba:say("酿酒？⻔主这是不打算还给⼈家了？")
wait_twn(subanjian:flip(),subanjian:jump())
subanjian:say("⽼⼦借东西，何时还过？")
baishiba:say("这好好的岁炙叶，当真拿来酿酒喝？")
subanjian:say("好好的⻩粱，不也拿来酿酒喝了？")
baishiba:say("可这……")
hide_all_stage_bubble()
subanjian:flip()
wait_twn(subanjian:movetoX(400),subanjian:daze())
subanjian:say("莫说是⼏⽚叶⼦，便是这好好的⼈⼉，不也被这江湖拿来酿了酒？")
wait_twn(baishiba:movetoX(800),baishiba:daze())
baishiba:say("门主，此话怎讲？")
wait_twn(play_sfx("Voice/Male1_Laugh_1.wav"),subanjian:say("哈哈哈……"))
subanjian:say("这世间⼈，有⼏个会成为他们⾃⼰希望的样⼦？")
subanjian:say("叶⼦也好，⾼粱也好，⻩⾦也好，⽟⽯也好，没有谁规定它们应该在哪⾥派上⽤场。")
subanjian:say("或许啊，酿成美酒⼀醉解千愁，才是这世间万物最好的归宿吧！")
baishiba:shake()
baishiba:say("只怕到时候是“借酒消愁愁更愁”喽……")


black_scene(0.5)
hide_stage()
set_flag("完成红叶酿酒")
light_scene(0.25)
