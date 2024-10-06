show_stage("厨房.png", "厨房")
play_bgm("Music/日常_烟火人间.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local liuming = actor("刘明")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
liuming:setPos(1300, 75)
situ:face_right()
liuming:face_left()

wait_twn(situ:movetoX(800), situ:daze())

situ:say("老刘，你挥舞铁钳的样子，还真有点大漠豪侠的风范。")
liuming:say("掌门，您又拿俺开玩笑了。")
situ:say("不，我是说真的。你这股子劲头，确实有点那味道了。")
liuming:say("掌门，俺一直有个疑问。您不惜成本给俺买了三十把大铁钳子，为何不直接赐俺一把刀剑呢？")
situ:say("我是在等你主动开口。因为我知道，你学武是被我推着走的。我想看看，你是否真的有那颗向往武学的心。")
liuming:say("掌门您真是用心良苦啊。")
situ:say("那么，现在你需要我赐你刀剑了吗？")
liuming:say("不需要了！")
situ:say("啊？这是为何？")
liuming:say("这几天俺用铁钳练刀法剑法，发现这东西还挺顺手。俺想，俺就用这铁钳当兵器了。")
situ:say("哈哈，江湖上奇特的兵器我确实见过不少，画桥书苑的何惧风使的是判官笔，飞星云顶的雍祺老尼使的是九节鞭，但使火钳子的，你刘明绝对是第一人啊。")
liuming:say("哈哈，从此以后，江湖中就多了一个拿钳子的侠客了。")
situ:say("好一个“火钳刘明”，这名字响亮！你这就去江湖上闯一闯，让所有人都知道虎焰门“火钳刘明”的大名！")
hide_all_stage_bubble()

change_favor_by_id("刘明", 1)

black_scene(0.25)
hide_stage()
set_flag("完成刘明剧情4")
light_scene(0.25)
