show_stage("禁地.png", "摄魂司遗迹")
set_bg_mat("ImgPaperFold")
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(-400, 75)
situ:face_right()
qiliuge:setPos(-700, 75)
qiliuge:face_right()

--先一起走过去
situ:movetoX(1100)
wait_twn(qiliuge:movetoX(800), qiliuge:daze())

situ:flip()
situ:say("六哥，按照师父所言，此处便是”摄魂司“。摄魂司曾是我教中秘地，如今重建之责，落在你我肩上。我们必须确保每一步都精准无误。")
qiliuge:say("掌门莫愁，我已制定周密重建计划。一旦建成，摄魂司将再次成为江湖中令人畏惧的存在。")
situ:say("那么，我们就开始行动吧。摄魂司的荣耀，将由我们亲手恢复。")

hide_all_stage_bubble()
black_scene(0.25)
hide_stage()
set_flag("已解锁恐吓")

pop_tip("现在可以在<color=red>摄魂司</color>执行<color=#ff7a00>恐吓威胁</color>计谋了。")
light_scene(0.25)
