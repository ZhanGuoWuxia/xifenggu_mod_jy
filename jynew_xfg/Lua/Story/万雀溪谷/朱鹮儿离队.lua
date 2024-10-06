show_stage("bg_219.png", "虎焰门大堂")
set_bg_mat("ImgPaperFold")
light_scene(0.2)

local situ = actor("司徒来也")
local zhuhuaner = actor("朱鹮儿")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(900, 75)
situ:face_right()
zhuhuaner:setPos(2400, 75)
zhuhuaner:face_left()

wait_twn(zhuhuaner:movetoX(1400), zhuhuaner:daze())

zhuhuaner:say("(player:fullname)，真没想到，你竟是这般孬种，连向万雀溪谷宣战的勇气都没有。")
situ:say("我……我只是……想要准备得更充分一些……")
zhuhuaner:say("我朱鹮儿真是瞎了眼，看错了你。既然你不敢去，那我就一个人去！")
hide_all_stage_bubble()
zhuhuaner:flip()
wait_twn(zhuhuaner:movetoX(1800), zhuhuaner:daze())
situ:say("朱鹮儿……")
hide_all_stage_bubble()
local options = {
  "留住朱鹮儿，并立刻向万雀溪谷宣战",
  "放任朱鹮儿离去"
}
local idx = show_quick_selections(options)
if idx == 1 then
  situ:say("朱鹮儿——")
  zhuhuaner:flip()
  situ:say("我(player:fullname)，岂是贪生怕死之辈？万雀溪谷，今日便宣战！")
  zhuhuaner:say("小(player:gname)，放心，到时候你就站在我身后，我保护好你。")
  local diplomatic = require("Common/diplomatic")
  diplomatic.declare_war("player", "万雀溪谷")
else
  situ:say("……")
  hide_all_stage_bubble()
  zhuhuaner:movetoX(3000)
  if leave_menpai("朱鹮儿") then
    pop_tip("<color=#ff7a00>朱鹮儿</color>离开了虎焰门")
    play_sfx("Tip/Tip1.wav")
  end
end

hide_all_stage_bubble()
black_scene(0.25)
hide_stage()
set_flag("完成朱鹮儿离队")
light_scene(0.25)
