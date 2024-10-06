
show_stage("禁地.png", "训练场")
play_bgm("Music/西门香.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("西门香")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(900), situ:daze())

situ:say("香儿，那日你在水塘旁，一剑刺杀了凶猛的黑熊，用的是什么剑法？好生精湛！")
npc:say("那是我师傅赵让所传，名为“一剑穿灵”。")
situ:say("“一剑穿灵”，听这名字便知其威力，似能在一瞬间穿透灵魂。你竟已学得此等高深剑法，实在令人敬佩。")
npc:say("我才学得皮毛，那天能刺中巨熊要害，纯属侥幸。这一剑需速度与准头并重，我尚需勤加修炼。")
situ:say("令师赵让，可是当年江湖中轻功独步天下的那位高手？")
npc:say("正是家师。他今年虽已年迈，轻功虽不如当年，但剑法仍是江湖一绝。")
situ:say("想当年，赵让老先生在江湖中轻功无人能及，剑法更是出神入化。有如此之师，加上你自己天资聪颖，怪不得香儿武功如此精湛。")

npc:say("少来彩虹屁啦~ 武道之路没有尽头。我这“一剑穿灵”距离化境还有相当距离……")
npc:say("这些年来武学一直未有大的精进，还须多多在江湖历练。")
situ:say("(香儿认真的样子真可爱。)")

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成一剑穿灵")
light_scene(0.25)
