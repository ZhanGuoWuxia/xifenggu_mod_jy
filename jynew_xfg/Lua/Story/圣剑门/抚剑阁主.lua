
local subtitles = {"深夜 抚剑阁"}

--初始化场景和背景音乐
show_cg(subtitles)
show_stage("紫色大厅.png", "抚剑阁")
play_bgm("Music/阴冷_段小年.wav", 0.1)
light_scene(0.2)

--需要补充一个角色 暂时用临时角色 临时立绘代替
local chuyu = actor("[speaker:楚玉][img:ai_female_3]")
local jiyeman = actor("姬野蔓")

--初始化位置和朝向
bright_all_actors()

chuyu:setPos(700, 75)
chuyu:face_left()
jiyeman:setPos(-500, 75)
jiyeman:face_right()

--剧情
chuyu:say("唉……")
hide_all_stage_bubble()
chuyu:flip()
wait_twn(chuyu:movetoX(1500),chuyu:daze())
chuyu:flip()
wait_twn(chuyu:movetoX(900),chuyu:daze())
chuyu:shake()
chuyu:say("唉……怎么办才好……")
wait_twn(jiyeman:movetoX(400),jiyeman:daze())
jiyeman:say("什么事竟能让堂堂抚剑阁的二阁主坐立不安，胆战心惊？")
chuyu:shake()
chuyu:say("唉……")
chuyu:say("那虎焰门竟从一个黄毛小子手中涅槃重生，势头比之前还凶猛！当真让人战栗……")
jiyeman:flip()
jiyeman:say("怎么？一个黄毛小子还能让你楚公子胆怯了？")
chuyu:say("阁主说笑了……只是这小子却同我料想大相径庭……")
jiyeman:flip()
jiyeman:say("哦？有何不同？")
chuyu:shake()
chuyu:say("他的眼神……")
jiyeman:say("楚玉，撒泼般从执剑人手中要了你来我抚剑阁，看重的就是你绝世无双的俊颜和英姿，可如今，却有些后悔了……")
chuyu:say("阁主这是何意？")
jiyeman:say("一个眼神都能让你胆战心惊，我还真是失望啊……")
chuyu:shake()
wait_twn(chuyu:offsetY(-70),chuyu:daze())
chuyu:say("属下并非是怕……只是那小子……")
jiyeman:flip()
jiyeman:say("我倒觉得那黄毛小子有些手段，你身上所欠的就是那股英勇无畏，若哪天你也充满了愤怒和力量，才不算辜负了先前我对你的执迷。")
chuyu:say("属下是怕司徒来也这帮人，伤了阁主大人，瞻前顾后所以才畏首畏尾！绝非——")
jiyeman:say("少些借口！拿出些男子气概来，扫平虎焰门那些狂徒！")
jiyeman:flip()
wait_twn(chuyu:offsetY(70),chuyu:daze())
chuyu:say("是！")
jiyeman:say("不过你看得倒细！那小子的眼神里，确实有一种难得一见的炙热。")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成抚剑阁主")
light_scene(0.25)
