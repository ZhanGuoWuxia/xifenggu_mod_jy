
show_stage("bg_92.png", "万雀溪谷")
play_bgm("Music/密谋_夜郎.wav", 0.1)
light_scene(0.2)

local dingxuan = actor("丁宣")
local rouer = actor("柔儿")

--初始化位置和朝向
bright_all_actors()
dingxuan:setPos(-500, 75)
dingxuan:face_right()
rouer:setPos(1300, 75)
rouer:face_left()

wait_twn(dingxuan:movetoX(1000), dingxuan:daze())

rouer:say("天师，先前谷主吩咐的事，调查的如何了？")
dingxuan:say("查是查到了，可那小贱人不长眼，似乎是投奔了虎焰门……不好抓了呀！")
rouer:say("哎呀，这可就麻烦了——")
dingxuan:say("还望柔夫人救命！若小贱人当真与虎焰门扯上了关系，小的哪儿斗得过啊。")
rouer:say("天师当真斗不过？别是不想斗吧。")
dingxuan:say("哎呦！冤枉啊！小的不过就是个走江湖算卦的，靠着坑蒙拐骗混口饭吃……哪有那本事啊！")
rouer:say("我记得天师似乎也是稻花村人？莫不是在为稻花村的漏网之鱼开脱？")
dingxuan:say("正是正是！小的虽说是稻花村人，但也是早年间逃难时投奔过来的。若非柔夫人赏识提携，如何有今日的富贵发达？")
rouer:say("天师能记得这情分就好……罢了，此事我自去向谷主禀报便是。")
dingxuan:say("哎哎！那虎焰门那边……")
rouer:say("那就劳烦天师盯紧些，但凡有了任何动向，都要立刻回报！")
dingxuan:say("哎！哎！这个自然！这个自然！")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成私下密谋")
light_scene(0.25)
