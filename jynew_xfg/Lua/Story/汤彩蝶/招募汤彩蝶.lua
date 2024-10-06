
show_stage("bg_172.png", "选妃桥")
play_bgm("Music/Lively.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local tangbainiu = actor("汤白牛")
local tangcaidie = actor("汤彩蝶")

--初始化位置和朝向
bright_all_actors()

situ:setPos(-400, 75)
situ:face_right()
tangbainiu:setPos(1100, 75)
tangbainiu:face_left()
tangcaidie:setPos(1400, 75)
tangcaidie:face_left()

wait_twn(situ:movetoX(700), situ:daze())

situ:say("汤神医，江湖风波险恶，虎焰门虽非避世之地，却愿为你遮风挡雨。你的医术若能惠及我门中弟子，亦是天下苍生之福。")
tangbainiu:flip()
tangbainiu:say("阿姊，虎焰门中人皆是行侠仗义之辈，你我若能同处一门，定能携手行善，共济天下。")
tangcaidie:say("(player:fname)掌门，白牛，你们的好意我心领了。但行医之道，本应无分贵贱，普救含灵之苦。若只为一门之利，岂不背离了我的初衷？")
situ:say("汤神医，你的仁心仁术，正是我等所敬仰。虎焰门虽小，却也有救济天下之志。若姑娘愿以医术助人，我们自当全力支持。")
tangbainiu:say("阿姊，虎焰门中人，皆是心怀天下的英雄豪杰。你的医术若能助他们一臂之力，便是助了天下无数受苦的百姓。")
tangcaidie:say("既然如此，我便与你们同行。但有一事，我必须明言——我所行之事，必须以天下苍生为念，不为任何门派私利。")
situ:say("这是自然，汤神医的高风亮节，正是我们所钦佩之处。")
hide_all_stage_bubble()

player_add_disciple("汤彩蝶")

black_scene(0.25)
hide_stage()
set_flag("完成招募汤彩蝶")
light_scene(0.25)
