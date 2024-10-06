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

situ:emotion("KunHuo")
situ:say("老刘，这么早就叮叮当当地敲什么呀？")
liuming:flip()
liuming:say("掌门，您可知道这虎焰门每天清晨的第一团火都是俺用这火石生起来的，然后三娘才能给大家蒸上馒头煮上面。")
situ:emotion()
situ:say("老刘，你可是咱们虎焰门的火之希望，这生火的技艺，非同小可。")
liuming:say("掌门说笑了，一般人用火石打十到十五下能擦出火花，俺刘明的话，哈哈哈，只要打三下，火苗子就飘起来了。")
situ:emotion("KunHuo")
situ:say("那是相当可以。")
liuming:say("看到火苗起来那还只是第一步，如何控火、移火、更火、熄火，学问还多着呢。")
situ:emotion()
situ:say("老刘技艺精湛！")
situ:say("火之奥义，在于掌控，正如我们武林中人，需驾驭心中之火，方能行走江湖，守护门派。")
liuming:say("掌门，俺读书少，您说得真有道理。俺为虎焰门生火，就如同为虎焰门守护一般。")
hide_all_stage_bubble()

change_favor_by_id("刘明", 1)
add_player_item("猛虎丹", 1)

black_scene(0.25)
hide_stage()
set_flag("完成刘明剧情1")
light_scene(0.25)
