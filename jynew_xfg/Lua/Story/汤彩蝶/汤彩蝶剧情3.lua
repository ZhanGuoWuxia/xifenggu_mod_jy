
show_stage("bg_172.png", "选妃桥")
play_bgm("Music/舒缓_云淡风轻.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("汤彩蝶")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(900), situ:daze())

situ:say("唉，几次三番说了这小菜里少放些胡荽，店家如何这般不会做事？")
npc:say("这也不怪他们，掌门所点这小菜本味微涩，放胡荽最能祛腥增味。")
situ:say("可我尝来，这胡荽当真难以下咽。")
npc:say("说来也奇，这胡荽性温味辛，自带一股淡香，可偏偏有不少人不喜。")
npc:say("哎呀，这可真是“彼之蜜糖，吾之砒霜”了，这胡荽入口的差别，当真需要记下！")
situ:say("不过是各人的吃食喜好不同罢了，神医如何连这些细枝末节都如此在意？")
situ:say("神医对这些细节如此上心，莫非还有什么原因？")
npc:say("实不相瞒，舍弟也对胡荽的味道颇为敏感，我之所以留意这些，是想在为他准备食物时，能够尽量避免他不喜欢的东西。")
situ:say("既然如此，今后若有需要，我愿意助神医一臂之力，为您的弟弟尝试食物，以免他吃到不喜欢的味道。")
npc:say("这……这如何使得，怎能麻烦掌门为我家的私事劳神。")
situ:say("神医太客气了，既然我们同在江湖，相互帮助是应该的。神医的家人，也就是我的朋友，这点小事不足挂齿。")
npc:say("那我就代舍弟先行谢过掌门了。今后若有需要，汤彩蝶自当铭记这份情谊。")

hide_all_stage_bubble()

change_favor_by_id("汤彩蝶", 1)

black_scene(0.25)
hide_stage()
set_flag("完成汤彩蝶剧情3")
light_scene(0.25)
