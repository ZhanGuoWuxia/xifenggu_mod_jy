show_stage("虎焰山树林.png", "虎焰山树林")
light_scene(0.2)
play_bgm("Music/决心_仗剑天涯.wav")

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
local liangsheng = actor("梁胜")

--初始化位置和朝向
bright_all_actors()
situ:setPos(1100, 75)
situ:face_right()
qiliuge:setPos(800, 75)
qiliuge:face_right()
liangsheng:setPos(1400, 75)
liangsheng:face_left()

local win_ret = current_win_ret
if win_ret == 1 then
    liangsheng:say("混蛋！老大一定会替我报仇的！")
    situ:say("哼！如此小人，不堪一击！")
    qiliuge:say("表面嚣张，没想到竟是蠢钝如猪，豪猪长垄当真“人杰地灵”。")
    situ:say("他不过是仗势欺人，接下来才当真是硬仗。")
    --add_player_item("梁胜的眼珠子", 1)
else
    liangsheng:say("原来是虎焰门的(player:fname)小儿，没想到这么不经打。")
    situ:say("这仇我记下了！日后定来讨回！")
end

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
remove_flag("攻打豪猪长垄阵型")
light_scene(0.25)
