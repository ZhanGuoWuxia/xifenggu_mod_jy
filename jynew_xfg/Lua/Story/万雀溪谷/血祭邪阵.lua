
show_stage("bg_92.png", "万雀溪谷")
play_bgm("Music/密谋_夜郎.wav", 0.1)
light_scene(0.2)

local dingxuan = actor("丁宣")
local wanhecheng = actor("万壑成")

--初始化位置和朝向
bright_all_actors()
dingxuan:setPos(-400, 75)
dingxuan:face_right()
wanhecheng:setPos(1100, 75)
wanhecheng:face_left()

wait_twn(dingxuan:movetoX(800), dingxuan:daze())

dingxuan:say("属下参见谷主。")
wanhecheng:say("天师，此番为祭祀风水血阵寻觅人选，进展如何？在稻花村，可是遭遇了什么阻碍？")
dingxuan:say("属下不才，未能达成谷主期望。稻花村之行，确实是困难重重……")
wanhecheng:say("哦？其中有何缘由？难道有人胆敢与我万雀溪谷为敌？")
dingxuan:say("启禀谷主，不知何人泄露了消息，乡野小民得知来我们是为了捉人祭天，哪有不惜命的？躲的躲，跑的跑。")
dingxuan:say("即便是搜寻再三，也仅能找到一些老弱病残之辈，难以满足血阵所需的气运。")
wanhecheng:say("大胆！竟敢破坏我大事！可有查出是何人走漏了风声？")
dingxuan:say("属下未能查明。")
wanhecheng:say("罢了，此事日后再说。眼下最重要的是风水血阵的启动。")
dingxuan:say("血阵催动之初，确实能引动四周草木生灵之精华。如今阵眼四周，日精月华聚集，但若不尽快补充，恐怕……")
wanhecheng:say("那么，我们便在百草青涧设下“观鱼赏花大会”，以此吸引村民前来，届时便可……")
dingxuan:say("谷主妙计！一旦村民为盛会所吸引，便无法逃脱我们的手掌心了。")
wanhecheng:say("我听你提及，这血阵似乎还有不为人知的奥妙？")
dingxuan:say("谷主英明，这血阵能吸取天地精华，助力万雀溪谷。但一旦启动，便如开弓之箭，无法回头。若有差池，恐有反噬之险。")
wanhecheng:say("若能保我谷昌盛不衰，些许风险又何足挂齿。待我谷在息风谷中独霸一方，这些顾虑自然烟消云散。")
dingxuan:say("谷主雄图伟业，属下定鞠躬尽瘁，死而后已，确保血阵圆满成功！")
wanhecheng:say("哈哈哈！如此甚好！若此阵顺利落成，天师当记头功！")

hide_all_stage_bubble()

role_add_affix("万壑成", "血色魔阵")
pop_tip(string.i18_format("万壑成受到{0}庇佑，功力大增！", affix_tip_link("血色魔阵", "血色魔阵", "#FF7A00")))

black_scene(0.25)
hide_stage()
set_flag("完成血祭邪阵")
light_scene(0.25)
