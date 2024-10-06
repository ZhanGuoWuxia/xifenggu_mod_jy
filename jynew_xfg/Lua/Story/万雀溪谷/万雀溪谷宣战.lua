
show_stage("bg_92.png", "万雀溪谷")
play_bgm("Music/密谋_夜郎.wav", 0.1)
light_scene(0.2)

local dingxuan = actor("丁宣")
local wanhecheng = actor("万壑成")

--初始化位置和朝向
bright_all_actors()
dingxuan:setPos(-400, 75)
dingxuan:face_right()
wanhecheng:setPos(1100, 75)
wanhecheng:face_left()

wait_twn(dingxuan:movetoX(800), dingxuan:daze())

dingxuan:say("属下参见谷主。")
wanhecheng:say("天师，这血阵确实好使，不过万雀溪谷的天地精华已经吸收殆尽。")
dingxuan:say("属下有一言，不知当讲不当讲？")
wanhecheng:say("天师，但说无妨。")
dingxuan:say("谷主现在实力已然登峰造极，正是对外扩张的时机。")
wanhecheng:say("哈哈哈！如此甚好！首当其冲便是虎焰门，即刻点兵出战！")
dingxuan:say("是！谷主！")

hide_all_stage_bubble()

--向相邻势力宣战
local neighbor_menpais = get_neighbor_menpais("万雀溪谷")
for menpai, _ in pairs(neighbor_menpais) do
  if menpai ~= "万雀溪谷" then
    local diplomatic = require("Common/diplomatic")
    diplomatic.declare_war("万雀溪谷", menpai)
  end
end

black_scene(0.25)
hide_stage()
set_flag("完成万雀溪谷宣战")
light_scene(0.25)
