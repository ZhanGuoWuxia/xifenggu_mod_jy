
show_stage("bg_219.png", "虎焰堂")
play_bgm("Music/舒缓_云淡风轻.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
local zsniang = actor("朱三娘")

--初始化位置和朝向
bright_all_actors()
zsniang:setPos(-400, 75)
zsniang:face_right()
qiliuge:setPos(-700, 75)
qiliuge:face_right()
situ:setPos(1300, 75)
situ:face_left()

wait_twn(zsniang:movetoX(900), zsniang:daze())

zsniang:say("掌门！")
situ:say("三娘，是为了六哥的事吧？你不必多言，他向来节俭，这次我也确实有些过火了。")
zsniang:say("掌门，请恕我多嘴，有句话不知当说不当说？")
situ:say("但说无妨。")
zsniang:say("掌门可知道，咱们几个人平日的吃食用度上，齐总管总是选择最差的那一份？")
situ:say("这话……是何意？")
zsniang:say("我平日里做饭，齐总管总是叮嘱我将好吃的、难得一见的菜肴优先留给掌门和刘明。而他，总是将就着吃些剩饭。")
situ:say("竟是这样，我竟然从未察觉。")
zsniang:say("掌门，所谓“当家才知柴米贵”，咱们虎焰门如今虽然没落，但其中的艰辛，都是齐总管默默承担的。")
situ:say("六哥他……看来那日我确实说得过分了。")
hide_all_stage_bubble()
wait_twn(qiliuge:movetoX(500), qiliuge:daze())
qiliuge:say("掌门有这份心意，我便感激不尽。")
situ:say("六哥！你何时来的？")
qiliuge:say("近日门中开支繁多，那日我一时心急，语气确实有些过激。")
situ:say("你不必道歉，这是我应该注意的。日后我定会注意节俭，不让你们为难。")

hide_all_stage_bubble()

change_favor_by_id("齐六哥", 1)

black_scene(0.25)
hide_stage()
set_flag("完成齐六哥剧情5")
light_scene(0.25)
