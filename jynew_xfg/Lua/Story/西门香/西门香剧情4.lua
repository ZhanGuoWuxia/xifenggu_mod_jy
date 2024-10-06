
show_stage("西门香的房间.png", "西门香的房间")
play_bgm("Music/西门香.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("西门香")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1200, 75)
situ:face_right()
npc:face_left()

situ:movetoX(800)
play_sfx("Skills/Wuxia/blade_2.mp3")
wait_twn(npc:movetoX(500, 4000), npc:offsetX(-300, 4000), npc:offsetX(1000, 4000), npc:offsetX(300, 4000), npc:movetoX(1200, 4000), situ:daze())
situ:say("咦……")
situ:emotion("WeiXiao")
situ:say("香儿，这手剑法真是精妙啊，看来你已经完全恢复了。")
npc:say("当然，区区困境，又怎能让我一蹶不振？")

npc:say("我西门香一旦立定主意，便如箭在弦，绝无回头之理。纵有千难万险，我也绝不会退缩。")
npc:say("喂，(player:fullname)，你我虽一同作战多时，但未曾单独较量比试过，不如趁今天我们来试试？")

situ:jump()
situ:say("啊……我突然想起来三娘喊我去吃包子，告辞告辞……")
situ:flip()
situ:jump()
npc:say("休要逃避，今天无论如何都得陪我练练！")
npc:say("别忘了我刚说的，我立定的主意谁也别想改变。(^ ^)")

hide_all_stage_bubble()
situ:movetoX(-500)
wait_twn(npc:movetoX(-500))

change_favor_by_id("西门香", 1)
roleId_change_affix("西门香", "虎啸鹤舞_西门香", "鹤影随行")
role_add_affix("司徒来也", "虎啸鹤舞_司徒来也")

black_scene(0.25)
hide_stage()
set_flag("完成西门香剧情4")
light_scene(0.25)
