show_stage("bg_219.png", "虎焰门大堂")
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

wait_twn(situ:offsetX(1100), situ:daze())

situ:say("老刘，你年轻时的经历，我略有耳闻，但从未听你亲自讲述过。")
liuming:say("那都是俺小时候的事情了。当时，俺拜入谢焚仙的门下学习火工，天资平庸，进步缓慢。尽管如此，俺并未因此而气馁，反而更加努力地修炼。")
situ:say("谢焚仙？")
liuming:say("直到有一天，俺偶然撞见了谢焚仙修炼邪火秘术的情景。尽管俺并未将此事放在心上，但谢焚仙却因此对俺心生芥蒂。")
situ:say("那你是怎么来到虎焰门的？")
liuming:say("后来，家中遭遇不幸，父母双亡，俺孤身一人，被老掌门收养，并带入了虎焰门，继续担任火工。")
situ:say("你的经历颇为坎坷，但你却从未放弃。你与朱三娘的欢喜冤家，更是让我感受到了你的真情实感。")
liuming:say("掌门，若不是您的悉心教导，俺恐怕无法成长为今天的模样。")
situ:say("老刘，你的天赋一直都在，只是需要时间去觉醒。如今，你已经成为了虎焰门的骄傲，你的武功更是独步江湖。")
liuming:say("掌门，您的夸奖，俺心领了。")

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成老刘的经历")
light_scene(0.25)