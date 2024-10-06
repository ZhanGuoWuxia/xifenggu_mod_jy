local subtitles = {"观剑阁"}

--初始化场景和背景音乐
show_cg(subtitles)
show_stage("温泉.png", "观剑阁")
play_bgm("Music/山雨欲来风满楼.wav", 0.1)
light_scene(0.2)

local xiaoyaner = actor("小燕儿")
local wanglong = actor("王珑")

--初始化位置和朝向
bright_all_actors()

xiaoyaner:setPos(2500, 30)
xiaoyaner:face_left()
wanglong:setPos(500, 75)
wanglong:face_right()

--主线
wait_twn(xiaoyaner:movetoX(1300,2000),xiaoyaner:daze())
wait_twn(xiaoyaner:movetoY(-50),xiaoyaner:daze())
xiaoyaner:say("主人……观剑阁没了，我们岂不是……没有容身之所了？")
wait_twn(wanglong:movetoX(1000),wanglong:daze())
wanglong:say("先不要慌，我们先退回执剑阁，找其他阁主们相助吧！")
wait_twn(xiaoyaner:offsetY(50),xiaoyaner:daze())
xiaoyaner:say("是！")
hide_all_stage_bubble()
wanglong:flip()
wanglong:movetoX(-500)
xiaoyaner:movetoX(-500)

--选择了保守断剑秘密
xiaoyaner:jump()
xiaoyaner:say("这……这……主人，咱们观剑阁都要被虎焰门拆没了，您为何还不出手阻止！")
wanglong:flip()
wanglong:say("拆了便拆了吧……")
xiaoyaner:say("那我们今后岂不是没有容身之处了？")
xiaoyaner:jump()
wanglong:say("息风谷如此之大，何处不能安居呢……")

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成攻下观剑阁")
light_scene(0.25)
