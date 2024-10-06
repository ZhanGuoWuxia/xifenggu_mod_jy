show_stage("龙湾门大堂.png", "龙湾门大堂")
light_scene(0.2)
play_bgm("Music/回忆.wav")

local dongfangtun = actor("东方豚")
local situ = actor("司徒来也")

--初始化位置和朝向
dark_all_actors()
situ:setPos(-500, 75)
situ:face_right()
dongfangtun:setPos(1300, 75)
dongfangtun:face_left()

wait_twn(situ:movetoX(900), situ:daze())

situ:say("东方豚，一切都结束了！让你苟延残喘了这么久！")
dongfangtun:say("(player:fullname)，这一世我败了，下一世我必将卷土重来，与你再决胜负！")
situ:say("兄弟阋于墙，龙湾门最终亡于你们自己的内斗！你我之间的恩怨，今天就此了结！")
dongfangtun:say("来世再见，后会有期！")
hide_all_stage_bubble()
dongfangtun:movetoY(-600, 5000)
kill_disciple("东方豚")
situ:say("……")

destroy_menpai("龙湾门")

hide_all_stage_bubble()

black_scene(0.25)
set_flag("完成龙湾灭亡结局")
hide_stage()
light_scene(0.25)
