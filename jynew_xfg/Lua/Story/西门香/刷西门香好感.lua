
show_stage("西门香的房间.png", "西门香的房间")
light_scene(0.2)
play_bgm("Music/西门香.wav", 0.1)

local situ = actor("司徒来也")
local npc = actor("西门香")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1200, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(800), situ:daze())

if has_flag("完成西门香剧情3") then
    npc:say("(player:fullname)，我有一个问题。")
    situ:say("（打起十二分精神！）请讲~")
    npc:say("你说“父母之命，媒妁之言”，自古以来都是如此，那就是对的么？")
    situ:say("这个…… 讲实话我也不太懂")
    npc:say("那人为什么要结婚？")
    situ:say("（挠头）啊？这个我也没仔细想过诶…… 不是为了生孩子吗？")
    npc:say("呆子……")
else
    situ:say("香儿，在这虎焰门中，你还适应吗？")
    npc:say("身子已经好多了，在这里过得颇为舒心。")
    situ:say("这里虽然不及鹤岭门繁华，但也有许多有意思的去处，闲来我们可以去逛逛。")
    situ:say("如果有什么不习惯、不周之处及时跟我们说呀。")
    npc:say("哪怕是粗茶淡饭，也比天天被关在家里应付那些油腻的家伙们好多了。")
end

hide_all_stage_bubble()

change_favor_by_id("西门香", 1)
add_player_item("猛虎丹", 1)

black_scene(0.25)
hide_stage()
light_scene(0.25)
