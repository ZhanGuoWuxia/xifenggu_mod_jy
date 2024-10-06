
show_stage("走廊.png", "圣剑门")
play_bgm("Music/抒情_柔情似水.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local xiaoyaner = actor("小燕儿")
local wanglong = actor("王珑")

--初始化位置和朝向
bright_all_actors()

situ:setPos(2500, 75)
situ:face_left()
wanglong:setPos(800, 75)
wanglong:face_right()
xiaoyaner:setPos(600, 50)
xiaoyaner:face_right()


--圣剑门/王珑的结局.lua

--剧情
wait_twn(situ:movetoX(1500),situ:daze())
situ:say("王阁主")
situ:say("其实你早就知道百里烟波已经不在，为何不告诉其他阁主呢？")
wanglong:shake()
wanglong:say("圣剑门这个地方很奇怪，四大剑阁在执剑人的命令下顺畅运转，它看上去坚不可摧，可实际不也尔虞我诈……")
situ:flip()
situ:say("正如范道平的天蚕壳证实了他处处提防着姬野蔓。")
wanglong:say("范道平两面三刀，朗自归道貌岸然，而姬野蔓更是蛇蝎美人……")
situ:flip()
situ:say("哈哈……还有你，这个看破不说破，让人看不透的隐藏者。")
hide_all_stage_bubble()
wanglong:flip()
wait_twn(wanglong:movetoX(300),wanglong:daze())
wanglong:flip()
wanglong:say("哈哈哈……我先前将这秘密咽于腹中，没让圣剑门因这样的四人而破灭，无奈却遇到了你！")

situ:say("的确，如果若让他们腾云圣剑已断，那就一定会猜到执剑人已死，那么圣剑门必然血雨腥风。")
wanglong:jump()
wanglong:say("所以自然要谢谢你保守了秘密。")
situ:say("可是没想到，最后无意中打破圣剑门平静的还是我……")
wanglong:say("总会有人将这金玉败絮之局面打破，恰好是你这种刚正不阿之人，也算圣剑门之幸！")
situ:say("呵呵……王阁主真是谬赞了。")
wanglong:say("怎会是谬赞，息风谷倒是需要虎焰门这样的门派，需要你这样正气凛然的少侠啊……只是息风谷不再需要我这样的人了……")
situ:say("哦？这是打算离开？")
wanglong:say("是啊，传说这北地雪人，是我求而不得。幸而还有小燕儿相助，就不知心愿能否实现了……")
situ:say("那便祝你得偿所愿！")
wanglong:say("彼此彼此！我知道你一直在寻夜鸦，也祝你能寻得你的缘法！这里有些东西，希望能成为你的助力！")
situ:say("多谢王阁主了")
wanglong:shake()
wanglong:say("唉，燕儿我们走吧")
wanglong:flip()
xiaoyaner:flip()
xiaoyaner:movetoX(-500)
wanglong:movetoX(-500)
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成王珑的结局")
light_scene(0.25)
