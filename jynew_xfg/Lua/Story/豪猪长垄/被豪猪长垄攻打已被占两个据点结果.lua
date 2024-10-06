show_stage("虎焰山树林.png", "虎焰山树林")
light_scene(0.2)
play_bgm("Music/豪猪恶贼.wav")

local hemeng = actor("何猛")
local panmazi = actor("潘麻子")
local situ = actor("司徒来也")

--初始化位置和朝向
bright_all_actors()
hemeng:setPos(1000, 75)
hemeng:face_left()
panmazi:setPos(1400, 75)
panmazi:face_left()
situ:setPos(500, 75)
situ:face_right()

local win_ret = current_win_ret
if win_ret == 2 then
    situ:say("豪猪崽子们，快滚回你们的洞里去！")
    hemeng:say("这小兔崽子还挺硬？好汉不吃眼前亏。")
else
    situ:say("别慌！一定还有办法！")
end

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
remove_flag("被豪猪长垄攻打阵型")
light_scene(0.25)
