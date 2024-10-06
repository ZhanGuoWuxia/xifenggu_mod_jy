show_stage("bg_186.png", "鹿追的房间")
play_bgm("Music/少女鹿追.wav")

local luzhui = actor("鹿追")
local situ = actor("司徒来也")

--初始化位置和朝向
dark_all_actors()
situ:bright()
situ:setPos(-400, 75)
situ:face_right()
situ:emotion("WeiXiao")
luzhui:face_left()
luzhui:setPos(1200, 75)

wait_twn(situ:movetoX(800), situ:daze())

situ:say("鹿追姑娘，你的名字还真是别致。")
luzhui:say("是吗？")
situ:say("鹿追，听上去就像是你在追逐着什么。")
luzhui:say("你说的没错，奶奶说我出生的时候，四周有几只小鹿在草丛中追逐欢嬉，所以我就得了鹿追这个名字。")
situ:emotion("DaXiao")
situ:say("这个…啊哈哈哈哈！")
luzhui:say("夫君你笑什么？")
situ:say("我只是在想，如果你出生的时候旁边有一只猴子在爬树，那你是不是应该叫……猴攀！啊哈哈哈哈哈。")
luzhui:say("猴攀……这种名字也太难听了啦。")
situ:say("如果当时有只野猪在旁边吃白菜，那你是不是就会叫……猪拱！哇哈哈哈哈！太好笑了！")
luzhui:say("夫君你太讨厌了，你才是猪拱呢！")

change_favor_by_id("鹿追",1)
roleId_change_affix("鹿追", "华茂春松", "天佑之女")

black_scene(0.25)
hide_stage()
set_flag("完成鹿追剧情2")
light_scene(0.25)
