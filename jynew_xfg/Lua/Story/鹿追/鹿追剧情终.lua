show_stage("百草清涧.png", "夜晚, 虎焰门郊外")
play_bgm("Music/少女鹿追.wav")

local luzhui = actor("鹿追")
local situ = actor("司徒来也")



--初始化位置和朝向
dark_all_actors()
luzhui:bright()
luzhui:setPos(-400, 75)
luzhui:face_right()
situ:setPos(1200, 75)
situ:face_left()

wait_twn(luzhui:movetoX(1000), situ:shake())
stage_narration("在深沉的夜色中，鹿追轻轻地步向(player:fullname)，她的眼中充满了柔情与关切。她伸出手，轻抚着他皱起的眉头，声音温柔如春水。")
luzhui:say("夫君……你的眉头又皱起来了。")
situ:say("鹿儿，你总是能一眼看穿我的心思。我……")
luzhui:say("我知道这些日子，你有多难熬。虽然鹿儿从小就没见过爹和娘，但奶奶过世的那个冬天，我哭得非常伤心，我懂那种失去亲人的痛。")
situ:say("鹿儿……")
luzhui:say("但是，你现在又有了新的家人，我就是你的家人。")
stage_narration("(player:fullname)心中的坚硬被鹿追的真挚所融化，他的手臂自然而然地环抱住了她，仿佛找到了避风的港湾。")
wait_twn(situ:offsetX(-50, 100), situ:spring_scale(1.03, 1.03, 1, 0.7))
situ:say("鹿儿，我发现我现在越来越离不开你了。")
luzhui:say("我也是，我想一直在你身边。")
situ:say("鹿儿……我……")
luzhui:say("来，抱抱。")
situ:say("嗯……")
stage_narration("在这静谧的夜空下，两个影子温柔地合成了一个……")
hide_all_stage_bubble()

roleId_change_affix("鹿追", "巫山云雨_鹿追", "鸳俦凤侣_鹿追")
roleId_change_affix("司徒来也", "巫山云雨_司徒来也", "鸳俦凤侣_司徒来也")

show_card{"鹿追的心意"}
add_player_item("鹿追的心意", 1, "#(3-5)")

restore_api.add_fire_point(5)

black_scene(0.25)
hide_stage()
set_flag("完成鹿追剧情终")
tgr_achivement("鸾凤和鸣")
light_scene(0.25)
