
show_stage("bg_15.png", "虎焰堂")
play_bgm("Music/阴冷_段小年.wav", 0.1)
light_scene(0.2)

local duanxiaonian = actor("段小年")
local situ = actor("司徒来也")

--初始化位置和朝向
bright_all_actors()

duanxiaonian:setPos(700, 75)
duanxiaonian:face_right()
situ:setPos(1100, 75)
situ:face_left()

duanxiaonian:say("(player:fname)掌门，实在是对不住您。")
situ:say("段姑娘何须如此，你我之间，何来道歉之说？")
duanxiaonian:say("(player:fname)掌门与南宫燕本是一脉亲人，虎焰门与仙竹门若是联手，即便是圣剑门也要退避三舍。")
duanxiaonian:say("如今却因为我，使得两门成了水火不容之势，小女子心中愧疚难当。")
situ:say("若是真有联手之日，又怎会等到今日？")
duanxiaonian:say("莫非两门之间，早有嫌隙？")
situ:say("自我记事起，虎焰门与仙竹门从无往来。")
situ:say("南宫燕，这个名义上的姨母，对我来说，不过是个陌生的名字。家父家母遭遇不幸，她亦未曾露面。")
duanxiaonian:say("这是为何？南宫燕毕竟是掌门母亲的亲姊。")
situ:say("具体缘由，我并不知晓。但幼时曾听母亲无意间提及，在我出生之际，南宫燕竟曾意图加害于我。若非天意，我命早绝。")
duanxiaonian:say("竟有如此深仇大恨？")
situ:say("正是因此，南宫燕对我而言，不过是心头的阴影。此次你出现，恰好给了我一个机会。")
duanxiaonian:say("机会？")
situ:say("是的，一直以来，我苦无机会正面挑战南宫燕。如今两门交恶，正是我揭开真相之时。我要知道，她当年为何要置我于死地。")
duanxiaonian:say("(player:fname)掌门，我明白了。小女子愿意助您一臂之力，一同揭开这个谜团。")
situ:say("好，那就让我们携手共进，让真相大白于天下。")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成血脉之仇")
light_scene(0.25)
