
show_stage("仙竹门.png", "仙竹门")
play_bgm("Music/回忆.wav", 0.1)
light_scene(0.2)

local nangongyan = actor("南宫燕")
local lvpaoni = actor("绿袍尼")

--初始化位置和朝向
bright_all_actors()

nangongyan:setPos(700, 75)
nangongyan:face_right()
lvpaoni:setPos(1100, 75)
lvpaoni:face_left()

nangongyan:say("大师，依您之见，这息风谷中，谁可堪称真正的武学巅峰？")
lvpaoni:say("掌门，近年来您的天仙万毒掌已臻化境，江湖之上，无人不晓。")
lvpaoni:say("便是那东方骤雨、西门坡等豪杰，也对您敬畏三分。")
lvpaoni:say("至于那(player:fname)雷，曾与您齐名，可惜不幸遭遇夜鸦之劫，已随风而逝了。")
nangongyan:say("不必提及此人。")
lvpaoni:say("是……")
lvpaoni:say("掌门之毒术，独步江湖，只不过……")
nangongyan:say("只不过什么？")
lvpaoni:say("若论江湖第一高人，只怕还是非圣剑门的百里烟波莫属。")
lvpaoni:say("他虽久未露面，但江湖中仍有他的传说。朗自归、王珑等绝顶高手，皆对其心悦诚服。百里烟波不露锋芒，却能令圣剑门威震江湖，保持其在息风谷的霸主地位。")
nangongyan:say("男人啊……")
lvpaoni:say("掌门，我相信不久的将来，息风谷的第一高手，必将是一位以毒术称霸江湖的女侠。")
nangongyan:say("大师何出此言？")
lvpaoni:say("掌门的毒掌是依靠黑水仙的毒性，但这黑水仙对您的身体也有害，不宜过多服用。")
nangongyan:say("是啊，正因如此，我难以达到黑血魔骨的用毒最高境界。")
lvpaoni:say("此乃姑获鸟之瓶。")
lvpaoni:say("若以天仙子配合胎儿之血，炼制成丹，可以祛除掉黑水仙对自身的毒性，这么一来掌门放心的服用黑水仙，您的毒术将增强百倍，届时便是百里烟波，也非您的对手。")
nangongyan:say("此物果然神奇！但胎儿之血，从何而来？")
lvpaoni:say("二十年前……")
nangongyan:say("大师，我仙竹门行事，应以仁义为重。昔日之事，不必再说。")
nangongyan:say("我南宫燕若要成为江湖第一高手，绝不会以牺牲无辜为代价")
lvpaoni:say("掌门教训的是，绿袍尼受教了。")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成第一毒女")
light_scene(0.25)
