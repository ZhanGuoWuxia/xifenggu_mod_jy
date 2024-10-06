
show_stage("bg_172.png", "选妃桥")
play_bgm("Music/舒缓_云淡风轻.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("汤彩蝶")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(900), situ:daze())

situ:say("汤神医在想什么，竟如此入神？")
npc:say("哎？让掌门见笑了……不过是有些困惑，一时难以开解。")
situ:say("在下虽不才，但好歹也是有些见过经过的，若神医不嫌弃，兴许能帮衬些？")
npc:say("掌门谦让了，这事儿兴许还真得劳烦掌门帮忙！")
situ:say("哦？说来听听？")
npc:say("掌门武功不凡，可知与人切磋之时，这格挡招架的招式、力道该如何形容描述？")
situ:say("这……这还当真有些不好言说，不过神医如何问起这些？")
npc:say("虽有些赧然，可也不敢欺瞒。我是为了写些演义传奇，可打斗的段落却无从下手。")
situ:say("我竟不知，汤神医还有这样的才气？")
npc:say("这是我已经写好的部分，掌门若不介意，可以先行一观，给我一些指教。")
situ:say("甚好甚好！我就喜欢看些热闹本子！我倒有些好奇，汤神医如何想写这些了？")
npc:say("还不是为了舍弟？白牛平日里便喜欢这些，他若看了，一定开心。")

hide_all_stage_bubble()

change_favor_by_id("汤彩蝶", 1)
roleId_change_affix("汤彩蝶", "凤栖梧", "似桂如兰")

black_scene(0.25)
hide_stage()
set_flag("完成汤彩蝶剧情4")
light_scene(0.25)
