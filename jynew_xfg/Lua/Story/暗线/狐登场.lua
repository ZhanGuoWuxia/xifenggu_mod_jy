show_stage("殿内.png", "??")
light_scene(0.2)
play_bgm("Music/密谋_夜郎.wav")

local hu = actor("[speaker:黑衣女][img:ai2_female_26]")
local yelang = actor("夜郎")

--初始化位置和朝向
dark_all_actors()
hu:setOverrideName("??")
hu:stylize("Silhouette")
hu:setPos(700, 75)
hu:face_right()
yelang:setOverrideName("??")
yelang:stylize("Silhouette")
yelang:setPos(1100, 75)
yelang:face_left()

hu:say("一切如计划所料，豪猪长垄果然动作频频。")
yelang:say("豪猪长垄那种门派，不用别人动手，迟早也会自取灭亡。")
hu:say("您认为虎焰门剩下的那几个人能敌过豪猪长垄？")
yelang:say("虎焰门这小火苗，不会那么轻易熄灭的。")
hu:say("但要是龙湾门出手的话，虎焰门多半就会扛不住了。")
yelang:say("那便看<color=red>那个人</color>的造化了……")

black_scene(0.25)
hide_stage()
set_flag("完成狐登场")
light_scene(0.25)
