
show_stage("龙万莹的房间.png", "龙万莹的房间")
play_bgm("Music/回忆.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("龙万莹")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1100, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(800), situ:daze())

situ:say("见夫人状态渐入佳境，实在令人高兴。")
npc:say("(player:fname)掌门不仅救了我性命，还愿意倾听我这些年的遭遇，我心中感激不尽。")
situ:say("夫人这些年吃了不少苦头，若不嫌弃，可以一直留在虎焰门。")
npc:say("(player:fname)掌门年纪轻轻，但为人宽厚，比起那东方骤雨，真是胜了许多。")
situ:say("夫人过奖了，“得势不欺人”，这是家父教我做人的道理。")
npc:say("好，虎焰门的事，就是我龙万莹的事，今后我愿听(player:fname)掌门差遣。")

hide_all_stage_bubble()

change_favor_by_id("龙万莹", 1)

black_scene(0.25)
hide_stage()
light_scene(0.25)
