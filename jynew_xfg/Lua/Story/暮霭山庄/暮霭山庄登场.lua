
show_stage("bg_161.png", "暮霭山庄")
light_scene(0.2)

local subanjian = actor("苏半见")
local baishiba = actor("白十八")

--初始化位置和朝向
bright_all_actors()

subanjian:setPos(700, 75)
subanjian:face_right()
baishiba:setPos(1100, 75)
baishiba:face_left()

subanjian:say("快，取上好的陈酿来，让俺在这血月之下，畅饮一番！")
baishiba:say("掌门，您这是要借酒消解心中块垒，还是要高歌一曲，以酒会友？")
subanjian:say("哈哈哈，俺苏半见一生行事，何来愁绪？今日饮酒，正是为了那(player:fname)雷的败北而庆祝！")
baishiba:say("(player:fname)雷虽与我暮霭山庄并无深交，却也谈不上有何冤仇，掌门何必如此高兴？")
subanjian:say("你不懂，那(player:fname)雷素来与我不和，如今他命丧黄泉，这是值得痛饮的一大快事！快，给俺满上，满上！")
baishiba:say("掌门，您真是让人佩服，日日都能找出诸多饮酒的由头。")
subanjian:say("废话少说，干了这杯，喝！喝！且让酒杯不停，欢乐不散！")
hide_all_stage_bubble()
unlock_menpai("暮霭山庄", true)

black_scene(0.25)
hide_stage()
set_flag("完成暮霭山庄登场")
light_scene(0.25)
