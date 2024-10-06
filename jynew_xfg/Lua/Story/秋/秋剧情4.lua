show_stage("bg_219.png", "虎焰堂")
light_scene(0.2)
play_bgm("Music/秋.wav")

local situ = actor("司徒来也")
local qiu = actor("秋")

--初始化位置和朝向
dark_all_actors()
situ:setPos(-400, 75)
situ:face_right()
qiu:setPos(1300, 75)
qiu:face_left()

wait_twn(situ:movetoX(900), situ:daze())

situ:say("关于你父母的遭遇，我已派人四处探听。")
qiu:say("？")
situ:say("我让六哥在江湖上打探，是否有谁知晓那种传说中的百毒不侵之草。")
qiu:say("有吗？")
situ:say("有！")
qiu:say("真的？")
situ:say("仙竹门的掌门南宫燕，她似乎在研究相关的植物。")
qiu:say("是她害了我父母？")
situ:say("尚不能断定，但我要告诉你，南宫燕的武功非同小可，而且……")
qiu:say("？")
situ:say("而且，她是我母亲的亲姐姐，我的姨母。")
qiu:say("姨母是什么？")
situ:say("姨母，就是我母亲的姐姐，哈哈哈。")
qiu:say("那…（少年露出了失望的表情，却不知如何用言语表达）")
situ:say("别担心，秋。如果她真是凶手，我绝不会让她逍遥法外。我与这个姨母的关系本就不睦，哈哈哈哈。")
qiu:say("嗯！")

change_favor_by_id("秋", 1)

black_scene(0.25)
set_flag("完成秋剧情4")
hide_stage()
light_scene(0.25)
