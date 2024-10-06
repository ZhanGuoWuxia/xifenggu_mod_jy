play_bgm("Music/少女鹿追.wav")
show_stage("bg_219.png", "虎焰堂")

local situ = actor("司徒来也")
local luzhui = actor("鹿追")

--初始化位置和朝向
bright_all_actors()
luzhui:setPos(-400, 75)
luzhui:face_right()
situ:setPos(1100, 75)
situ:face_left()

wait_twn(luzhui:movetoX(800), luzhui:daze())

if has_flag("完成邀请鹿追") then
    luzhui:say("(player:fname)掌门，还记得你曾邀请我一同回去的那一天吗？")
    situ:say("当然记得，那是我们初次并肩作战的日子。")
else
    luzhui:say("(player:fname)掌门，还记得我吗？")
    situ:say("原来是那日的鹿追姑娘，记忆犹新。")
end
luzhui:say("掌门记性真好，不愧是我鹿追心仪之人。")
wait_twn(hide_all_stage_bubble(), luzhui:offsetX(50), luzhui:offsetX(-50, 300), luzhui:offsetX(50), luzhui:offsetX(-50, 300))
situ:emotion("HaiXiu")
situ:say("姑娘，说话归说话，别拉拉扯扯的，男女授受不亲。")
luzhui:say("礼数？在我心中，你我早已超越了这些俗套。你可是我命中注定的那个人。")
if has_flag("完成邀请鹿追") then
    situ:say("姑娘，那是虽然我邀请你一同回去，但并不代表……")
else
    situ:say("姑娘，如此直白，让我如何是好。")
end
situ:say("虽然姑娘确实……天真可爱，但是姑娘此言，在下委实不敢当。")
luzhui:say("我哪里乱说了？你就是我要找的那个人！")
situ:say("等等！什么跟什么呀，哪个人？")
luzhui:say("你不是虎焰门现任掌门吗？难道这虎焰门现下还有第二个掌门不成？")
situ:say("我确实是虎焰门唯一的掌门，可你这话到底是什么意思，我怎么听不明白？")
luzhui:say("那就是了呀！我奶奶曾说，有朝一日，我会遇到那个与我共守火神的人，我看就是你。")
situ:say("这火神使者之事，我怎不知？")
luzhui:say("你不必知晓，只需知道，我鹿追认定了你，便不会更改。")
situ:say("姑娘一番美意，在下感激不尽。但此事太过突然，还望姑娘给些时间考虑。")
luzhui:say("时间自是有的，我带来的行囊不少，虎焰门总该有个安置之处。")
situ:emotion()
situ:say("姑娘这是要长住的意思？")
luzhui:say("正是。既然命运将我们相连，虎焰门的兴衰，便与我炙家族息息相关。")
situ:say("姑娘如此侠义心肠，(player:gname)自是欢迎。只是这男女之情，还需从长计议。")
luzhui:say("无妨，我有的是时间，让你真心实意地接受这份命运。")
hide_all_stage_bubble()

player_add_disciple("鹿追")

black_scene(0.25)
hide_stage()
set_flag("完成天降娇妻")
light_scene(0.25)


