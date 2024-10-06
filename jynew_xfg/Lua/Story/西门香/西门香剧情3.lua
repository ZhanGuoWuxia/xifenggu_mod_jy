
show_stage("西门香的房间.png", "西门香的房间")
play_bgm("Music/西门香.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("西门香")
local pinger = actor("[speaker:萍儿][img:ai2_female_20]")

--初始化位置和朝向
bright_all_actors()
pinger:setPos(-400, 75)
pinger:face_right()
situ:setPos(-700, 75)
situ:face_right()
npc:setPos(1200, 75)
npc:face_left()

wait_twn(pinger:movetoX(900), pinger:daze())

pinger:say("小姐，终于让我找到你了。")
npc:say("萍儿，你怎么来了？")
pinger:say("小姐，自你离家那日起，我便出来找你。我猜想你定是投奔了虎焰门。")
if has_flag("完成灭亡龙湾门") then
    pinger:say("小姐，我离开之时，龙湾门的东方豚公子已经前来求亲，听说老爷已决意将你许配给他。")
    npc:shake()
    npc:say("……我爹居然会不跟我商量，擅自做出这样的决定？")
    pinger:say("是的，小姐。老爷已然做下决定，这门亲事似乎已成定局。")
else
    pinger:say("小姐，我离开之时，听说老爷已决意将你许配给龙湾门的东方豚公子。")
    npc:shake()
    npc:say("……我爹居然会不跟我商量，擅自做出这样的决定？")
    pinger:say("是的，小姐。老爷已然前往龙湾门，这门亲事似乎已成定局。")
end

npc:say("哼，他痴心妄想。我是绝对不会屈从家里的安排，本小姐自己为自己做主。")
npc:say("你回去告诉我爹，我绝不会服从他的安排。")
pinger:say("小姐放心，我会回去告诉老爷的。有任何什么风吹草动，我也会第一时间告诉你。")
npc:say("谢谢你，我的好萍儿。")
hide_all_stage_bubble()
npc:flip()
wait_twn(pinger:movetoX(2500))
wait_twn(situ:movetoX(900), situ:daze())
situ:say("香儿，你们的对话我都听到了。")
npc:flip()
npc:say("我如今可真是无家可归了，但眼下还有更麻烦的事情……")
npc:say("我爹突然废除了我们的婚约，加之我离家出走，如果我爹知道的话，他更将会把虎焰门视为仇敌。")
npc:say("他此番前往龙湾门，恐怕不只是为了订婚一事，就怕二强连横，将虎焰门置于危险之地。")
situ:say("香儿…… 你不用过多为虎焰门担心，万事有我来担待。")

change_favor_by_id("西门香", -1)

black_scene(0.25)
hide_stage()
set_flag("完成西门香剧情3")
light_scene(0.25)
