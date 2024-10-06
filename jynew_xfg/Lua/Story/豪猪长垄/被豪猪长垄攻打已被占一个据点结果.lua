show_stage("虎焰山树林.png", "虎焰山树林")
light_scene(0.2)
play_bgm("Music/豪猪恶贼.wav")

local hemeng = actor("何猛")
local liangsheng = actor("梁胜")
local situ = actor("司徒来也")

--初始化位置和朝向
bright_all_actors()
hemeng:setPos(1000, 75)
hemeng:face_left()
liangsheng:setPos(1400, 75)
liangsheng:face_left()
situ:setPos(500, 75)
situ:face_right()

local win_ret = current_win_ret
if win_ret == 2 then
    situ:say("豪猪崽子们，还真以为虎焰门是好欺负的？")
    hemeng:say("这小兔崽子有两下子，下次再来收拾你们。")
else
    situ:say("得尽快想办法夺回来！")
end

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
remove_flag("被豪猪长垄攻打阵型")
light_scene(0.25)
