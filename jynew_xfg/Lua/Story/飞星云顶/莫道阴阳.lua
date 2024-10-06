
show_stage("门派宫殿.png", "飞星云顶")
play_bgm("Music/.mp3", 0.1)
light_scene(0.2)

local shibing = actor("石冰")
local moguang = actor("墨光")
local moying = actor("墨影")

--初始化位置和朝向
bright_all_actors()

shibing:setPos(500, 75)
shibing:face_right()
moguang:setPos(800, 75)
moguang:face_left()
moying:setPos(1100, 75)
moying:face_left()

moguang:say("启禀阴阳王！虎焰门成日里大张旗鼓来飞星云顶叫嚣，气焰颇是嚣张。")
moying:say("禀告阴阳王，墨光所言甚是。自虎焰门上次丢了火神树林一带，便如同刮了逆鳞一般，现下……")
shibing:say("阴阳王”听着就刺耳，莫在叫了，以后便还是叫掌门罢了。")
moguang:say("这……")
moying:say("是，掌门……")
shibing:say("接下来我要在观星颠修养，只留贺如烟在侧辅佐即可。至于其他，你们两个看好便是。")
moguang:say("那虎焰门我们该如何是好，还请掌门指点一二！")
shibing:say("你们两个难道连个虎焰门的事都处理不了？再者，门中还有子瑾风，他对付得了。若无旁事，别打扰我……")
moguang:say("墨影，你说这掌门人又是闭关修炼何等功法，这凤蝶之舞已是息风谷第一神功，莫非还不够？")
moying:say("这掌门人之事岂是你我能猜到一二的？")
moguang:say("罢了罢了，还是想想办法如何对付虎焰门吧。")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成莫道阴阳")
light_scene(0.25)
