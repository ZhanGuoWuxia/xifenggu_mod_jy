
show_stage("酒香亭.png", "酒家")
play_bgm("Music/回忆.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("朱鹮儿")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1300, 75)
situ:face_right()
npc:face_right()

situ:emotion("NaoHuo")
wait_twn(situ:movetoX(800), situ:daze())
npc:flip()
situ:say("万壑成这家伙，一定要受到应有的惩罚！")
npc:say("今天怎么这么大的火气？")
situ:emotion()
situ:say("从虎苇地到虎焰堂，原本有一条溪涧流过，我小时候经常在里面捉蝌蚪。")
npc:say("我怎么没看到哪里有条溪。")
situ:say("几年前，这条溪慢慢干涸了。")
npc:say("是被你捉蝌蚪捉干了吧，哈哈。")
situ:say("昨天我让六哥去查勘了一番，原来是溪水从源头被截断了。")
npc:say("这种做法，难不成是……")
situ:say("那截断后的水源，顺着一条人工挖凿的渠道流向了……")
npc:say("万雀溪谷？")
situ:say("没错。")
npc:say("这个万壑成，还真是好不讲理，怪不得人们都称他作“鬼斧”。")
situ:say("如果那条溪还在的话……")
situ:say("那晚虎焰堂的火，或许能被灭掉吧；或许爹和娘，还有活的希望。")
wait_twn(npc:movetoX(1000), npc:daze())
npc:say("别伤心了，小(player:gname)，我朱鹮儿陪你一起报仇。")

hide_all_stage_bubble()

change_favor_by_id("朱鹮儿", 1)

black_scene(0.25)
hide_stage()
set_flag("完成朱鹮儿剧情3")
light_scene(0.25)
