show_stage("火神树林.png", "火神树林")
set_bg_mat("ImgPaperFold")
play_bgm("Music/抉择_一念之间.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
local illidan = actor("伊笠耽")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(400, 75)
situ:face_right()
qiliuge:setPos(200, 75)
qiliuge:face_right()
illidan:setPos(1400, 75)
illidan:face_right()


situ:say("六哥，这片火神树林之中，当真有一位隐居的绝世大侠？")
if not has_flag("完成抵抗偷袭") then
  qiliuge:say("正是，掌门。上次六哥说有火神大人消灭了豪猪长垄的小喽啰，说的神乎其神，玄而又玄。我派人暗中调查了一番。")
end
qiliuge:say("听说这位大侠虽目不能视，但听力超群，身法灵动，剑法更是出神入化，江湖人称“夺命追猎者”, 若能得到他的助力，我等如虎添翼。")
hide_all_stage_bubble()
situ:movetoX(1100)
wait_twn(qiliuge:movetoX(800), qiliuge:daze())

illidan:flip()
illidan:say("来者何人?")
situ:say("在下(player:fullname)，特来拜访，愿大侠能加入我们，共同行走江湖。")
illidan:say("我本厌倦了江湖的血雨腥风，想于此片红林之中了却余生。")
play_bgm("Music/决心_仗剑天涯.wav")
illidan:say("可如今匪徒贼人当道，胆敢闯入我的领地，扰我清幽。")
illidan:say("他们这是自寻死路!")
qiliuge:say("大侠不愧是大侠，说的话都这么深奥。")
illidan:say("是时候开始新的狩猎了！")
situ:say("大侠豪爽，正义会得到伸张！")
hide_all_stage_bubble()
player_add_disciple("伊笠耽")
set_flag("已招募伊笠耽")
hide_stage()
light_scene(0.25)