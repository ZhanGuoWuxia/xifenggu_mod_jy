
show_stage("bg_219.png", "虎焰门大堂")
play_bgm("Music/日常_烟火人间.wav", 0.1)
light_scene(0.2)

local luzhui = actor("鹿追")
local situ = actor("司徒来也")

--初始化位置和朝向
bright_all_actors()

luzhui:setPos(-400, 75)
luzhui:face_right()
situ:setPos(1100, 75)
situ:face_left()

wait_twn(luzhui:movetoX(800), luzhui:daze())
luzhui:say("夫君，你可在吗？我有一件重要的事情想要与你商议。")
situ:say("小鹿姑娘，有何要事让你如此慎重？")
luzhui:say("夫君，这是岁炙叶。《岁炙叶手稿》的记载与我们家族的传说不谋而合。")
luzhui:say("岁炙叶的神秘力量，可与《疾风烈焰掌》相辅相成，或能助你武学修为更上一层楼。")
situ:say("小鹿姑娘，这份礼物太过珍贵。你为何愿意赠予我？")
luzhui:say("传闻若能收集到三百片岁炙叶，便能触发一段不为人知的奇缘。")
luzhui:say("我想便是：开启《疾风烈焰掌》之最高境界。")
situ:say("奇缘？")
luzhui:say("正是，那传说中未曾有人触及的武学巅峰，或许就将因这岁炙叶而现世。")
situ:say("如此奇闻，我竟未曾听闻？或许连我爹也未曾达到此等境界。")
luzhui:say("夫君，你是我们炙家族的希望所在，我愿将这二百八十片岁炙叶托付于你。")
situ:say("小鹿姑娘，此情此义，我(player:fullname)无以为报。")
luzhui:say("夫君，你无需言谢。我只希望你能记得我的好。")
situ:say("那么，我便依照手稿所示，潜心修炼。我定不会辜负你的期望。")

hide_all_stage_bubble()

add_player_item("岁炙叶", 280)

black_scene(0.25)
hide_stage()
set_flag("完成消失的岁炙叶")
light_scene(0.25)
