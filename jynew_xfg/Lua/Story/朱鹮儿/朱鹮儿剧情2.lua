
show_stage("禁地.png", "训练场")
play_bgm("Music/密谋_夜郎.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("朱鹮儿")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_right()

npc:spring_scale(1.5, 1.03, 1.03)
wait_twn(situ:movetoX(800), situ:daze())
npc:flip()
situ:say("鹮儿姑娘这箭法，颇为老练，不似寻常女子。")
npc:say("多谢小(player:gname)的夸赞。")
situ:say("鹮儿姑娘，我听说女子多以绣花为巧，你为何会选择舞刀弄箭呢？")
npc:say("这还得从万雀溪谷说起。")
npc:say("我们稻花村本是个富饶之地，水稻长得饱满又香甜。但自从万壑成成了万雀溪谷的掌门，一切都变了。")
npc:say("他自称效仿禹帝治水，却只做些损人利己的勾当。他将附近的水源全部切断，引入自己的溪谷，建造浴池、温泉，沉溺于享乐。")
situ:say("此等行径，确实可恶。")
npc:say("他断了虎焰山脉流向稻花村的水源，让我们村失去了生计。以前我们还能卖点稻子，现在连自己的口粮都不足了。")
situ:say("这万壑成，真是罪孽深重。")
npc:say("为了生存，我只好自学弓箭，上山狩猎，以野味充饥。")
situ:say("鹮儿姑娘，你放心，虎焰门一定会为稻花村讨回公道。")

hide_all_stage_bubble()

change_favor_by_id("朱鹮儿", 1)
roleId_change_affix("朱鹮儿", "风流灵巧", "心比天高")

black_scene(0.25)
hide_stage()
set_flag("完成朱鹮儿剧情2")
light_scene(0.25)
