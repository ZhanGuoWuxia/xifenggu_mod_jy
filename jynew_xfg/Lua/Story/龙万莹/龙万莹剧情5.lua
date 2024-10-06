
show_stage("龙万莹的房间.png", "龙万莹的房间")
play_bgm("Music/回忆.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("龙万莹")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1100, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(800), situ:daze())

situ:say("夫人上次提到，在食为鲜中那个杀人的瘦书生，后来发生了何事？")
npc:say("那个瘦书生的面容，我至今仍记忆犹新。他的皮肤苍白如雪，眉目清秀，脸上总是一副漠然之色。没错，他就是那个捅死鹤岭门铁驴子的凶手。")
npc:say("虽然我已不知宋郎生死，但真正的凶手就在眼前，我决定要查个水落石出。")
situ:say("夫人您既然认出了他，难道没有上前质问吗？")
npc:say("我没有冲动，而是选择了暗中跟踪。我从繁华的市集跟到了幽静的小巷，从茂密的林间跟到了偏僻的山头。")
situ:say("您真的确定他就是当年的那个瘦书生吗？")
npc:say("非常确定！虽然已过七年，他的衣着、步伐、气息都变了，但那张脸，我一辈子也忘不了。")
situ:say("那您跟踪他，难道没有遭遇危险吗？")
npc:say("跟到一片荒凉的山野时，我突然被人从背后袭击，昏迷了过去。")
situ:say("为了查明真相，夫人您真是历经艰辛。")
npc:say("昏迷中，我感觉到一个巨人扛着我走了很长的山路，他一只手就能把我提起来。")
situ:say("巨人？莫非是当年的胖书生？")
npc:say("不是胖书生，那人的体型有两倍正常人那么大，但我看不见。")
situ:say("真是庞大无比。")
npc:say("醒来时，我发现自己在一个昏暗的木屋里，眼前就是那个瘦书生。")
npc:say("或者说，他已经不再是个书生了，他身上的气息、表情，那种洞察一切的神态，完全像是个神。")
situ:say("他变化如此之大？")
npc:say("他身上散发出一种奇异的味道，让人闻了就不想动弹，永远留在原地。")
npc:say("我告诉他食为鲜的事情，指出他就是当年杀铁驴子的人。")
situ:say("他承认了？")
npc:say("他全部都承认了。")
npc:say("他声音温柔细腻，告诉我当年是谁帮他们逃脱罪名，让食为鲜背上杀人罪名。")
situ:say("是谁？")
npc:say("东方骤雨。出事那天晚上，他在食为鲜角落目睹了一切。")
situ:say("竟然是他？！")
npc:say("东方骤雨原本与此事无关，他也不认识那两个书生。他常来食为鲜喝酒，早已看上我，为了得到我，他利用此事诬陷食为鲜，让我们遭遇追杀，把我们拆散，然后得到我。")
situ:say("东方骤雨这个老贼，真是阴险。")
npc:say("那一晚，我终于明白了一切，我对人生感到彻底解脱，也彻底失去了信念。")
npc:say("那一夜，我没有任何心情归宿龙湾门，在那个神秘男人的黑色小木屋里，我释放了所有的阴暗情绪，我神魂颠倒，我醉生梦死。")
situ:say("哎……")
npc:say("醒来时，我已经睡在龙湾门附近的酒楼里，似乎什么也没有发生过。之后再也没有关于那个瘦书生，或者说是那个神秘男人的消息。")
situ:say("这个男人，听起来很不一般。")
npc:say("九个月后，我生下了东方狸……")

hide_all_stage_bubble()

change_favor_by_id("龙万莹", 1)
add_player_item("水蛇剑法", 1)

black_scene(0.25)
hide_stage()
set_flag("完成龙万莹剧情5")
light_scene(0.25)
