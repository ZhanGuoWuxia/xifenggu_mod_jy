local subtitles = {"⻁焰⻔"}

--初始化场景和背景音乐
show_cg(subtitles)
show_stage("殿内.png", "⻁焰⻔")
set_bg_mat("ImgPaperFold")
light_scene(0.2)
play_bgm("Music/日常_烟火人间.wav", 0.2)

--初始化人物
local situ = actor("司徒来也")
local luzhui = actor("鹿追")

--初始化位置和朝向
dark_all_actors()
situ:setPos(2500, 75)
situ:face_left()
luzhui:setPos(2700, 75)
luzhui:face_left()

--剧情
situ:movetoX(900)
wait_twn(luzhui:movetoX(1250),situ:daze())
situ:flip()
luzhui:jump()
wait_twn(luzhui:flip(),luzhui:flip())
wait_twn(play_sfx("Voice/Female2_Laugh_2.wav"),luzhui:say("太好了！太好了！司徒哥哥，太好了！"))
situ:movetoX(1000)
situ:say("这么兴奋？莫⾮是这第三百⽚岁炙叶出现了？")
luzhui:jump()
luzhui:say("是啊！今⽇⼀早，⽕神树枝头那鲜红的颜⾊，如同初⽣的朝阳⼀般，很是绚丽。")
situ:jump()
situ:say("那太好了，炙家族数百年历代⼈的愿望终于能在⼩⿅你⾝上实现了。")
luzhui:say("是啊！我已摘得这第三百⽚岁炙叶，实属不易！")
situ:say("攒⻬这三百⽚岁炙叶，岂不是可以召唤⽕神之⼒了。")
luzhui:jump()
luzhui:say("⾛！我们快快去⽕神树林试试！")
situ:flip()
situ:movetoX(-400)
luzhui:movetoX(-400)

black_scene(0.5)
hide_stage()
light_scene(0.25)
