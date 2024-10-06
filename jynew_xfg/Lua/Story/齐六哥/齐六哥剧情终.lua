
show_stage("bg_219.png", "虎焰堂")
play_bgm("Music/舒缓_云淡风轻.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("齐六哥")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(900), situ:daze())

npc:say("掌门，此刻可方便说话？")
situ:say("六哥来得正好！我正有事要与六哥商议。")
npc:say("既然如此，掌门请先说。")
situ:say("我近些时日，仔细琢磨了一下，关于咱们虎焰门如何节省维持的这件事情。")
npc:emotion("WeiXiao")
npc:say("哎呀，哈哈哈，原来掌门也为此事烦恼。")
situ:say("六哥为何发笑？难道我说了什么有趣的事情吗？")
npc:say("我也正是为了此事而来！只因这解决办法之中牵扯了一些细节需要同掌门商议。")
situ:emotion("WeiXiao")
situ:say("哈哈哈哈，这不巧了？我也是！倒不如六哥先说？")
npc:emotion()
npc:say("我的想法是利用咱们虎焰门中空下来的这几间厅堂，开个学堂武馆之类。一来把空地利用起来，能挣些生徒学费；二来若遇到有天份的，还能为咱们招揽人才。")
situ:emotion()
situ:say("正是呢正是呢！我也是在想这个！因看到三娘她用空闲的花园种地，这才想到，不仅是花园，连那些重新修好的屋舍说不定也能有些作用……只是——")
npc:say("掌门还有什么顾虑？")
situ:say("如果实施这个计划，虎焰门的人员管理和调派上可就更难了些。")
npc:say("这便是另一件事了！我因一直想着这些事情，总结了一些管理人事上的办法，掌门也过过目？")
situ:say("那就交给六哥处理吧。")
npc:say("掌门便放心将这些琐事交给我吧！我定会让咱们虎焰门重振往日荣光的！")

hide_all_stage_bubble()

change_favor_by_id("齐六哥", 1)
restore_api.add_fire_point(5)

black_scene(0.25)
hide_stage()
set_flag("完成齐六哥剧情终")
tgr_achivement("虎焰总管")
light_scene(0.25)
