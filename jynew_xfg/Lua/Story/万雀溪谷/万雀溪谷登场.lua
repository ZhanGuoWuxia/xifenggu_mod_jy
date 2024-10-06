
show_stage("bg_92.png", "万雀溪谷")
play_bgm("Music/密谋_夜郎.wav")
light_scene(0.2)

local shinv = actor("柔儿")
local wanhecheng = actor("万壑成")

--初始化位置和朝向
bright_all_actors()

shinv:setOverrideName("柔儿")
shinv:setPos(-400, 75)
shinv:face_right()
wanhecheng:setPos(1100, 75)
wanhecheng:face_left()

wait_twn(shinv:movetoX(800), shinv:daze())

shinv:say("谷主近来气色愈发佳妙，光彩照人，难道江湖之上，有何喜事临门？")
wanhecheng:say("当真如美人所言，昨夜天师匆匆来报，那传说中的夜鸦，竟又掠影江湖之上。")
shinv:say("恭喜谷主！贺喜谷主！想当年夜鸦一出，谷主便借其瑞气，转危为安。此次夜鸦重临，必是我万雀溪谷之福兆。")
wanhecheng:say("正是如此，夜鸦踪迹难觅，久未露面。今朝再现，无疑是溪谷大兴之预。")
wanhecheng:say("想当年病榻之上，得天师助我布下“还阳血阵”，借夜鸦之气运，方有今日之我。")
shinv:say("谷主吉人天相，这些年苦心经营风水阵法，终非徒劳。")
shinv:say("此番夜鸦归来，定是谷主虔诚所致，血祭感动天地，夜鸦来助，大事可成。")
wanhecheng:say("不错！江湖将因夜鸦而乱，正是我完善溪谷风水大阵之际。")
wanhecheng:say("届时血阵相辅，万雀溪谷必将昌盛无比，那些圣剑门、仙竹门，又岂在话下？")
shinv:say("若真如此，柔儿随谷主左右，岂不是能见证谷主一统息风谷之壮举？")
wanhecheng:say("美人如此贴心，待我掌管息风谷，又怎会忘却你之恩情？")
shinv:say("那柔儿便先讨个赏赐，不仅要成为万雀溪谷的万夫人，更要成为息风谷的万夫人。")
wanhecheng:say("哈哈哈！便依了你，这“息风谷万夫人”的名号，先赐予你了！")
hide_all_stage_bubble()
unlock_menpai("万雀溪谷", true)

black_scene(0.25)
hide_stage()
set_flag("完成万雀溪谷登场")
light_scene(0.25)
