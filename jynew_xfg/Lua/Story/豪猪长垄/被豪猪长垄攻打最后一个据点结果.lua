show_stage("虎焰山树林.png", "虎焰山树林")
light_scene(0.2)
play_bgm("Music/豪猪恶贼.wav")

local hemeng = actor("何猛")
local panmazi = actor("潘麻子")
local liangsheng = actor("梁胜")
local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")

--初始化位置和朝向
bright_all_actors()
hemeng:setPos(1000, 75)
hemeng:face_left()
panmazi:setPos(1400, 75)
panmazi:face_left()
liangsheng:setPos(1600, 75)
liangsheng:face_left()
situ:setPos(500, 75)
situ:face_right()
qiliuge:setPos(300, 75)
qiliuge:face_right()

local win_ret = current_win_ret
if win_ret == 2 then
    situ:say("可恶，幸好抵挡下来了，险些便要被灭掉了……")
    hemeng:say("呦，还挺能打，这块硬骨头还有些硌牙，撤！")
    hide_all_stage_bubble()
    black_scene(0.25)
    hide_stage()
    light_scene(0.25)
else
    hemeng:say("没想到，这江湖鼎鼎大名的虎焰门，竟然就这么被我豪猪长垄踏灭了火焰，哈哈哈！")
    situ:say("可恶…就这么…结束了吗。")
    qiliuge:say("掌门！全没了！全没了啊掌门！")
    situ:say("天要灭我虎焰门，我(player:fullname)不怕死，只是爹……娘……孩儿去了那边，又有什么脸面相聚啊！（拔剑自刎）")
    situ:offsetY(-300)
    qiliuge:say("掌门！(player:fullname)！不要！不要啊——（拔剑自刎）")
    qiliuge:offsetY(-300)
    black_scene(0.25)
    remove_flag("被豪猪长垄攻打阵型")
    hide_stage()
    game_over()
end

--game over 需要放lua逻辑分支的最后
