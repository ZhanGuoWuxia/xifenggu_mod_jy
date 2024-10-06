show_stage("夜晚豪猪长垄.png", "豪猪长垄")
light_scene(0.2)
play_bgm("Music/决心_仗剑天涯.wav")

local hemeng = actor("何猛")
local situ = actor("司徒来也")
local tangbainiu = actor("汤白牛")

--判断是否有汤白牛
local battle_param = current_battle_param
local is_ok = battle_param:IsInTeam1("汤白牛")

--初始化位置和朝向
bright_all_actors()
hemeng:setPos(700, 75)
hemeng:face_right()
situ:setPos(1000, 75)
situ:face_left()
if is_ok then
    tangbainiu:setPos(1400, 75)
    tangbainiu:face_left()
else
    tangbainiu:hide()
end


local win_ret = current_win_ret
if win_ret == 1 then
    hemeng:hide()
    situ:say("可恶！这俩家伙可跑得真快。")
    if is_ok then
        tangbainiu:say("阿姊！这里乱糟糟的，阿姊你到底在哪里？")
        wait_twn(situ:offsetY(-100), situ:daze())
        situ:say("三七、半夏、夜交藤、豪猪刺。")
        wait_twn(tangbainiu:offsetX(-200), tangbainiu:daze())
        situ:flip()
        tangbainiu:say("这，这是阿姊的笔迹？")
        situ:say("此中必有线索，我先记下来。")
        hide_all_stage_bubble()
        situ:offsetY(100)
        set_flag("获得药方")
    end
else
    situ:say("畜生！不但心黑，手段也够黑！")
    hemeng:say("不过如此？还是回虎焰门吧，少在这里丢人现眼。")
end

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
remove_flag("攻打豪猪长垄阵型")
light_scene(0.25)
