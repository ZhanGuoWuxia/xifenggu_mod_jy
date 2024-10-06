

show_stage("走廊.png", "圣剑门")
play_bgm("Music/西门香.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local jiyeman = actor("姬野蔓")

--初始化位置和朝向
bright_all_actors()

situ:setPos(2500, 75)
situ:face_left()
jiyeman:setPos(800, 75)
jiyeman:face_left()

--剧情
jiyeman:say("你来了…")
wait_twn(situ:movetoX(1500),situ:daze())
situ:say("姬阁主送我的紫色玫瑰，我可是一直随身携带着。")
jiyeman:flip()
jiyeman:shake()
jiyeman:say("哦？如此守信？只是这圣剑门散了，没有阁主，也没有什么玫瑰了……")
situ:jump()
situ:say("虎焰门从不缺土壤，也从不缺信，不知阁主可还守信？")
wait_twn(jiyeman:movetoX(1000),jiyeman:daze())
jiyeman:say("玫瑰本就稀少，自然要格外珍惜，只不过是否能开花结果还未可知……")
situ:say("那还得看姬阁主愿不愿意尝试了。")
jiyeman:shake()
jiyeman:say("既然这圣剑门的土地能够养出罕见的紫色玫瑰，我倒是想看看这虎焰门的土地又能结出什么果实。")
situ:say("那可说好了，不可反悔。")
jiyeman:flip()
jiyeman:say("我知晓你大仇未报，我既是说出口自然不会反悔，而且……这跟着你好像比跟着百里烟波更有意思呢。")
situ:say("哈哈哈哈哈……这便好！这便好！")
jiyeman:say("不过掌门，我不会三四年都见不到你一面吧？")
wait_twn(situ:movetoX(1300),situ:daze())
situ:say("哈哈哈哈……你且能忍着三四年不找我，但我可忍不住不找你啊……")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成紫色约定的果实")
light_scene(0.25)
