
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

shibing:say("哈哈哈！终于到手了！墨光、墨影！快将这火神之树最好的根茎砍下！带回去好生存放！")
moying:say("遵命！")
moguang:say("喂，墨影，你说咱们这又是挖土又是砍树的，到底为什么？")
moying:say("阴阳王意图岂是我等能擅自揣测的？")
moguang:say("倒也是，只是多少年都未曾见过阴阳王如此兴奋了？莫非跟这树有什么干系……")
moying:say("少些话吧，阴阳王可不喜欢我们背后议论……")
moguang:say("嘁，墨影你虽嘴上这么说，其实内心也在好奇，不是吗？我还不知道你想什么？")
moying:say("若真好奇，干活时多留心便是……")
moguang:say("哇，这心思，还得是你啊……")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成火神之根")
light_scene(0.25)
