
show_stage("bg_226.png", "灵猹仙洞")
play_bgm("Music/日常_烟火人间", 0.1)
light_scene(0.2)

local xiada = actor("夏大")
local xiaer = actor("夏二")
local situ = actor("司徒来也")

--初始化位置和朝向
bright_all_actors()

xiada:setPos(800, 75)
xiada:face_right()
xiaer:setPos(500, 75)
xiaer:face_right()
situ:setPos(1100, 75)
situ:face_left()

xiaer:say("这虎焰门当真有些本事啊，咱们……")
xiada:say("如今灵猹仙洞已不复存在，你我兄弟们反倒轻松了。")
situ:say("灵猹六怪倒也豁达，我只与夜鸦有仇，江湖虽大，但义气长存。你们若有何打算，不妨直言。")
xiada:say("我们兄弟已决定，从此退隐江湖，不再过问世事。或许，这才是最好的归宿。")
xiaer:say("是啊，大哥，我们兄弟这些年来，也累了。是时候找个安静的地方，好好享受余生。")
situ:say("夏大、夏二，你们兄弟的决定，我理解。江湖虽大，但总有归处。愿你们兄弟今后的日子，平安喜乐。")
xiada:say("多谢(player:fname)掌门。我们兄弟就此别过，江湖再见。")
xiaer:say("再见了，(player:fname)掌门。愿虎焰门日后能够安然无恙，江湖再无夜鸦之患。")
situ:say("保重，夏大、夏二。江湖虽远，但义气永存。我们后会有期。")

hide_all_stage_bubble()

destroy_menpai("灵猹仙洞")
pop_tip("<color=#ff7a00>灵猹六怪</color>归隐仙洞")
play_sfx("Tip/Tip1.wav")

black_scene(0.25)
hide_stage()
set_flag("完成灵猹仙洞灭亡结局")
light_scene(0.25)
