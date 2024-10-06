show_stage("bg_219.png", "虎焰堂")
play_bgm("Music/少女鹿追.wav")

local situ = actor("司徒来也")
local luzhui = actor("鹿追")

--初始化位置和朝向
dark_all_actors()
situ:bright()
situ:setPos(600, 75)
situ:face_right()

luzhui:bright()
luzhui:face_left()
luzhui:setPos(2300, 75)

wait_twn(situ:offsetX(300, 200),
        situ:daze(0.5),
        situ:flip(),
        situ:offsetX(-300, 200),
        situ:daze(0.5)
)
wait_twn(luzhui:movetoX(1200))
luzhui:say("夫君，你又在思考什么呢。")
wait_twn(situ:flip(), situ:offsetX(300, 700))
situ:emotion("BeiShang")
situ:say("小鹿，我心中一直有一个疑问，是关于你的。")
luzhui:say("关于我？你整日都在思索如何振兴虎焰门，今日终于想起了我，真是让人感动。")
situ:say("你们家族，为何每年都要摘取火神树上最红的叶子？这其中有什么特殊的含义吗？")
luzhui:say("有的!这其中有着极为重要的意义!")
luzhui:say("这是我们炙家族祖先留下来的传说。")
situ:emotion("KunHuo")
situ:say("传说？")
luzhui:say("正是。火神树上的树叶与树身一同吸收着天地间的火能量。")
situ:emotion()
situ:say("火能量？我曾听父亲提起，修炼疾风烈焰掌需要汇聚大量的火能量，但我对其具体并不了解。")
luzhui:say("大自然中的风、雷、电，四季交替，都会产生火能量。火神树之所以被称为神树，便是因为它能吸收这些自然界的火能量。")
situ:say("原来如此，神树之名便是由此而来。")
luzhui:say("每年秋天，树叶颜色最红的时候，也就是火能量蓄积最充沛的时候。而我们炙家族称那时最红的那片叶子为岁炙叶。")
situ:say("怪不得那日见你攀爬树梢，就是为了摘取那片叶子。")
luzhui:say("传说中，若能收集到三百片岁炙叶，便能触发一段不为人知的奇缘。")
situ:emotion("KunHuo")
situ:say("奇缘？")
luzhui:say("虽然不知道会发生什么，但这是我们炙家族历代相传的心愿。")
situ:emotion()
situ:say("简单，我们走！")
hide_all_stage_bubble()
wait_twn(situ:flip(), situ:movetoX(-400), situ:flip(), situ:movetoX(800))
luzhui:say("夫君你拿扫帚干啥？")
situ:emotion("WeiXiao")
situ:say("我现在就去帮你摘下三百片叶子，完成你们家族的心愿。")
luzhui:say("哎呀不行呀傻瓜，必须是三百片不同年份的岁炙叶。")
situ:emotion("DaXiao")
situ:say("哈哈哈，你叫我傻瓜。")
luzhui:say("我…你是个傻傻的夫君…呱呱。")
situ:emotion("WeiXiao")
situ:say("小鹿，告诉我，你现在收集多少片了？")
luzhui:say("从炙家族开始收集岁炙叶到现在，已经第八代或第九代了。如今，我们已经收集了二百八十片。")
situ:emotion("JingYa")
situ:say("什么？只差二十片了吗？！")
luzhui:say("是的！之前已经收集到了二百九十九片，后面被一位神秘人抢走了。")
situ:say("神秘人？应该也是和岁炙叶有关的人吧。那我就帮你找回来！")
luzhui:say("夫君，你真好！")
situ:emotion("WeiXiao")
situ:say("明年秋天，我也陪你一起去摘！")
wait_twn(luzhui:jumpTo(1000, 75))
luzhui:say("嘻嘻，谢谢夫君！好期待！")

change_favor_by_id("鹿追", 1)
change_favor_by_id("司徒来也", 1)
roleId_change_affix("鹿追", "鸳俦凤侣_鹿追", "华茂春松")
role_add_affix("司徒来也", "鸳俦凤侣_司徒来也")

black_scene(0.25)
hide_stage()
set_flag("完成鹿追剧情4")
light_scene(0.25)
