show_stage("殿内.png", "??")
light_scene(0.2)
play_bgm("Music/密谋_夜郎.wav")

local ao = actor("獒")
local yelang = actor("夜郎")

--初始化位置和朝向
dark_all_actors()
ao:setOverrideName("??")
ao:stylize("Silhouette")
ao:setPos(700, 75)
ao:face_right()
yelang:setOverrideName("??")
yelang:stylize("Silhouette")
yelang:setPos(1100, 75)
yelang:face_left()

yelang:say("先生的手，好些了吗？")
ao:say("疾风烈焰掌的威力还是非常强烈的。")
yelang:say("和你的震狼一击相比，哪个更强呢？")
ao:say("结果，也许就说明了一切吧。")
yelang:say("等你的伤势恢复好了，我们也该进行下一步行动了。")
ao:say("随时恭候大人的召唤。")
yelang:say("你看北边那座城，青山环绕，茂林深篁，似乎比息风谷更适合居住啊。")
ao:say("我已经多年没在那里居住了。")
yelang:say("事成之后，先生将是那里的主人，到那时，可记得邀我去你的地方溯溪品茗。")
ao:say("一定。")

black_scene(0.25)
hide_stage()
set_flag("完成獒登场")
light_scene(0.25)

