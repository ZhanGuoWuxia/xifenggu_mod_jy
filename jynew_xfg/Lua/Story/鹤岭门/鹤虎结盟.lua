
show_stage("华丽府内.png", "鹤岭门")
play_bgm("Music/回忆.wav")
light_scene(0.2)

local ximenpo = actor("西门坡")
local ximenting = actor("西门霆")
local zhaorang = actor("赵让")
local situ = actor("司徒来也")
local ximenxiang = actor("西门香")


--初始化位置和朝向
bright_all_actors()

ximenpo:setPos(1100, 75)
ximenpo:face_right()
zhaorang:setPos(700, 75)
zhaorang:face_right()
ximenting:setPos(400, 75)
ximenting:face_right()
situ:setPos(2500, 75)
situ:face_left()
ximenxiang:setPos(2800, 75)
ximenxiang:face_left()

ximenxiang:movetoX(1500)
wait_twn(situ:movetoX(1700), situ:daze())

situ:say("西门门主，如今我以虎焰门掌门的身份站在这里，来讨个公道！")
ximenpo:say("想不到我西门坡竟然看走了眼……押错了宝……")
ximenxiang:say("爹！亡羊补牢，为时不晚！")
ximenpo:say("想当年我西门坡为博得前任掌门赏识，不惜断情绝爱、不顾危险爬雪山寻千年人参。能从一个小喽啰翻身成为一门之主，如今却如此下场，可笑！")
ximenxiang:say("爹！别说了，娘亲她是只是深爱她的夫君，应该并不怪你……")
ximenting:say("姐姐，你说什么……我娘的事？爹，到底怎么回事？")
ximenpo:say("哎！我与虎焰门交好，与龙湾门交涉，将鹤岭门发扬光大，甚至将一对儿女托付给最信任的人，确保鹤岭门能够后继有人。难度都做错了？")
ximenpo:flip()
zhaorang:say("门主！从你为了得到老门主的信任，不惜以你夫人生命做赌注时就错了！")
ximenpo:say("……")
zhaorang:say("你所做的一切不过是满足你自己的私欲！")
ximenpo:say("……")
ximenpo:flip()
ximenxiang:say("爹！以后我们一家人好好活着，才是最大的幸福。")
ximenpo:say("罢了！罢了！希望(player:fname)掌门能给鹤岭门其他人一条生路。")
situ:say("西门门主，生或死一直都在你手中。")
ximenpo:say("我此后就在雪山，吃斋念佛以此祭慰亡妻在天之灵。")
ximenting:say("爹！我陪着你上雪山。")
if leave_menpai("西门坡") and leave_menpai("西门霆") then
  pop_tip("<color=#ff7a00>西门坡</color>和<color=#ff7a00>西门霆</color>归隐雪山")
  play_sfx("Tip/Tip1.wav")
end
set_menpai_leader("鹤岭门", "赵让", current_area)


local diplomatic = require("Common/diplomatic")
set_both_friendship("player", "鹤岭门", 100)
diplomatic.make_ally("player", "鹤岭门")

black_scene(0.25)
hide_stage()
set_flag("完成鹤虎结盟")
set_flag_int("鹤虎结盟回合数", get_game_round())
light_scene(0.25)
