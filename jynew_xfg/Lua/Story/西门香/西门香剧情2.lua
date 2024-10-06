
show_stage("bg_74.png", "桃花林")
play_bgm("Music/西门香.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("西门香")

--初始化位置和朝向
bright_all_actors()
npc:setPos(-400, 75)
npc:face_right()
situ:setPos(-700, 75)
situ:face_right()

--先一起走过去
npc:movetoX(1200)
wait_twn(situ:movetoX(900), situ:daze())

npc:flip()
npc:say("喂，(player:fullname)，你还记得我们小时候在这里捉迷藏吗？你总是藏得很好，让我找了好久都找不到。")
situ:emotion("WeiXiao")
situ:say("自然记得，那时候你总是急得团团转，最后还是我忍不住故意笑出声来，你才找到我藏身之处。")
npc:say("讨厌，谁能想到你跟猴子一样藏在那些高高的桃树上？")
situ:emotion("DaXiao")
situ:say("哈哈，想想那时真是胡闹，完全不知道那么高的树爬上去多么危险。")


npc:say("还有那次，我不小心摔进了河里，多亏你跳下来救了我，这次从熊手上救你也算还了小时候救命之恩了。")
situ:emotion()
situ:say("香儿，你小时候就像个小尾巴，总是爱跟着我屁股后面玩。")
npc:say("少嘚瑟，小孩子爱跟比自己年龄大的孩子玩罢了。")
situ:say("这些往事，你都还记得……")

npc:flip()
npc:say("我可不是常常记得，只是想起当年捉迷藏，这些旧事突然涌现上来。")
situ:say("香儿，你……")

npc:flip()
npc:say("骗你玩的，你也一样一直记得的是吧？(player:fname)大掌门~")


hide_all_stage_bubble()

change_favor_by_id("西门香", 1)
roleId_change_affix("西门香", "鹤影随行", "灵犀一点")

black_scene(0.25)
hide_stage()
set_flag("完成西门香剧情2")
light_scene(0.25)
