show_stage("虎焰山树林.png", "虎焰山树林")
light_scene(0.2)
play_bgm("Music/豪猪恶贼.wav")

local hemeng = actor("何猛")
local panmazi = actor("潘麻子")
local liangsheng = actor("梁胜")
local situ = actor("司徒来也")

--初始化位置和朝向
bright_all_actors()
hemeng:setPos(2000, 75)
hemeng:face_left()
panmazi:setPos(2400, 75)
panmazi:face_left()
liangsheng:setPos(2600, 75)
liangsheng:face_left()
situ:setPos(500, 75)
situ:face_right()

--先一起走过去
hemeng:offsetX(-1000)
wait_twn(panmazi:offsetX(-1000), panmazi:daze())
wait_twn(liangsheng:offsetX(-1000), liangsheng:daze())

hemeng:say("何猛：虎焰门？我何猛灭的就是虎焰门！")
panmazi:say("哈哈哈哈，虎焰门也有今天，兄弟们杀进去，把虎焰门抢个精光！给老大献礼！")
liangsheng:say("哈哈哈哈，冲啊，抢啊！美女们都是我的！")
situ:say("虎焰门的兄弟姐妹们，抵住这一波，我们就胜利了！")

black_scene(0.25)
hide_stage()
set_flag_int("被豪猪长垄攻打阵型", 4)
set_flag("完成被豪猪长垄攻打最后一个据点")
light_scene(0.25)
