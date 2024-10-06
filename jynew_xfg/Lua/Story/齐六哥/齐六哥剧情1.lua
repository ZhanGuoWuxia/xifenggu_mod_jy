
show_stage("bg_219.png", "虎焰堂")
play_bgm("Music/舒缓_云淡风轻.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("齐六哥")

--初始化位置和朝向
bright_all_actors()
situ:setPos(1300, 75)
npc:setPos(-400, 75)
situ:face_right()
npc:face_right()

--寻寻觅觅
wait_twn(situ:offsetX(500), situ:offsetY(-100), situ:daze(0.2), situ:offsetY(100), situ:flip(), situ:offsetX(-1350), situ:offsetY(-100), situ:daze(0.2), situ:offsetY(100), situ:flip(), situ:offsetX(900), situ:daze(0.2))

wait_twn(npc:movetoX(900), npc:daze())

npc:say("掌门，您在这寻觅何物？")
situ:flip()
situ:say("虎焰门遭劫，竟是连虎焰堂都不能幸免……可惜了那些武学典籍竟也被毁得七零八落。")
npc:say("掌门莫愁，我这里倒还有些武学秘籍。")
situ:say("这些许多典籍，六哥又是从哪里得来的？")
npc:say("说来惭愧……在下因功夫不精，因而总拿些基础典籍私下琢磨，后来就忘了归还……")
situ:say("这倒还要感谢六哥粗心之功啊。")
add_player_item("基础内功", 1)
add_player_item("基础身法", 1)
add_player_item("基础拳法", 1)
add_player_item("基础刀法", 1)
add_player_item("基础剑法", 1)
add_player_item("基础棍法", 1)
add_player_item("基础弓法", 1)
situ:say("多谢六哥，我正需要它们。咦，六哥，这些书页上竟然还有你做的标记？")
npc:say("是的，掌门。我想若是您日后还需查阅，有了标记便能迅速找到要点。")
situ:say("六哥，你真是太细心了……")
npc:say("可我拿走的这些不过都是寻常教程，那些高深秘籍可就……")
situ:say("这倒不必太过担忧，我听爹说过，担心门人执念修习繁复武学会走火入魔，因而特地分散安放。")
npc:say("也就是说，虽然虎焰堂被毁，可若细细找找，兴许还能有散落各处的拓印本？")
situ:say("六哥，我们找找看吧。")
hide_all_stage_bubble()
wait_twn(situ:flip(), situ:offsetX(300), situ:daze())
wait_twn(npc:flip(), npc:offsetX(-300), npc:flip(), npc:offsetY(-100), npc:daze())
npc:say("掌门，我这里还有些武学秘籍。")
hide_all_stage_bubble()
npc:offsetY(100)
wait_twn(situ:flip(), situ:offsetX(-200), situ:daze())
situ:say("正是，而且爹的意思，搜集秘籍同修习武学一样，切不可急于求成，须得循序渐进。")
npc:say("确实，像我便是这般贪多嚼不烂了……")
situ:say("确实。那我可得慎重选择，逐一研习了。")
hide_all_stage_bubble()

local item_options = {"少林身法", "罗汉拳", "猎鹰弓法", "青木功法"}
local item_idx = show_item_card_select(item_options)
local item_id = item_options[item_idx]
add_player_item(item_id, 1)

change_favor_by_id("齐六哥", 1)

black_scene(0.25)
hide_stage()
set_flag("完成齐六哥剧情1")
light_scene(0.25)
