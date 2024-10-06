show_stage("bg_219.png", "虎焰门大堂")
play_bgm("Music/日常_烟火人间.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local liuming = actor("刘明")

--初始化位置和朝向
bright_all_actors()
situ:setPos(800, 75)
liuming:setPos(3000, 75)
situ:face_right()
liuming:face_left()

wait_twn(liuming:movetoX(1200), liuming:daze())

liuming:say("掌门，俺最近修炼功夫遇到了瓶颈，感觉怎么也突破不了，想请您指点指点。")
situ:say("老刘，你能察觉到自己的瓶颈，已经很不错了。我爹常说，武学之路，本就是充满曲折和艰辛的。")
liuming:say("那俺应该怎么做，才能突破这个瓶颈呢？")
situ:say("你的瓶颈具体是什么？")
liuming:say("俺每当运行内力，脑中便浮现出师父操纵邪火烧死村民的情景，他总是念叨：“凝气为神，为我所用；焚其残躯，皆归尘土。”")
situ:say("你师父的教诲，恐怕已成你的心魔。")
liuming:say("俺这一套烧火的功夫，都是俺师父传授的。但是要更进一步，就需要以人试炼了，俺不忍心伤害他人。")
situ:say("老刘，“焚其残躯”四字，应该不是指伤人之术，而是教人应以身作则，献身武道。")
liuming:say("掌门，您是说……那是俺师父理解错了？")
situ:say("确实错了。火虽然能够烧尽一切，但它也能够照亮黑暗。你的瓶颈，恐怕是你对火的理解。")
liuming:say("掌门，俺明白了。")

hide_all_stage_bubble()

change_favor_by_id("刘明", 1)
restore_api.add_fire_point(5)

black_scene(0.25)
hide_stage()
set_flag("完成刘明剧情终")
tgr_achivement("烈火豪情")
light_scene(0.25)
