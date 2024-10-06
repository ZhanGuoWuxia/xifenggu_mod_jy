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
liuming:face_right()

wait_twn(situ:movetoX(800), situ:daze())

situ:say("老刘，老刘，需要帮忙吗？")
liuming:flip()
liuming:say("掌门，是掌门啊，您怎么来了?")
situ:say("我来看看你，你这厨房里的功夫，还是这么精湛。")
liuming:say("哪里哪里，掌门过奖了。")
situ:say("这是在烧什么，麦子吗?还挺香的。")
liuming:say("嘿嘿，掌门要不尝点，这手法俺可是跟三娘学的")
situ:say("先烧着吧，等你忙完我再来取便是了")
liuming:say("好，掌门，俺这就去忙。")
liuming:say("哟哎呦，火苗你像蝴蝶一样飞啊~火苗你像蝴蝶一样飞啊~")
situ:say("还唱起来了，我先溜了溜了。")

hide_all_stage_bubble()
wait_twn(situ:flip(), situ:daze(), situ:movetoX(-500))
stage_narration("刘明一个人继续他的工作，而厨房里回荡着刘明的歌声和欢快的气氛。")


change_favor_by_id("刘明", 1)
add_player_item("猛虎丹", 1)

black_scene(0.25)
hide_stage()
light_scene(0.25)
