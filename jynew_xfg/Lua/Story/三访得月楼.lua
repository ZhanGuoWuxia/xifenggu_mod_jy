show_stage("得月楼.png", "得月楼")
play_bgm("Music/舒缓_云淡风轻.wav")
light_scene(0.25)

local situ = actor("司徒来也")
local suyanyan = actor("苏嫣嫣")
local laoyu = actor("[speaker:老妪][img:ai_old_female_1]")

--初始化位置和朝向
situ:setPos(-400, 75)
situ:face_right()
if has_flag("完成地牢") then
    laoyu:setPos(2500, 75)
    laoyu:face_left()
    suyanyan:hide()
else
    suyanyan:setPos(1300, 75)
    suyanyan:face_right()
    laoyu:hide()
end


wait_twn(situ:movetoX(900), situ:daze())
if has_flag("完成地牢") then
    situ:say("嫣嫣姑娘，我刚从女儿村回来，原来小红是……")
    --环视四周
    for i = 1, 3 do
        wait_twn(situ:flip(0.2), situ:daze(), situ:say("嫣嫣姑娘！"))
    end
    situ:say("怎么得月楼空无一人？")
    situ:flip()
    wait_twn(laoyu:movetoX(1200), laoyu:daze())
    laoyu:say("谁说得月楼空无一人了？")
    situ:say("老人家，我是虎焰门的(player:fullname)，苏嫣嫣姑娘何在，我有事找她。")
    laoyu:say("(player:fname)少侠，你来的晚了。嫣嫣姑娘，她因那场与豪猪长垄的恶战不幸重伤，未能挺过那个夜晚，已经香消玉殒了。")
    play_bgm("Music/山雨欲来风满楼.wav")
    situ:say("这不可能！我几日前还与她书信往来，她分明嘱托我寻找小红，她的声音虽然略显柔弱，但绝不可能……")
    laoyu:say("少侠，事实如此，你不信可以去后山她的墓前一看。")
    situ:emotion()
    situ:say("……")
    situ:say("我分明还和她约好，待我找回小红，便与她重逢，怎么可能……")
    laoyu:say("哎……你先留在此地吧，我再去整理一下嫣嫣姑娘的遗物。")
    hide_all_stage_bubble()
    laoyu:flip()
    wait_twn(laoyu:movetoX(1600), laoyu:daze())
    laoyu:flip()
    laoyu:say("对了，前些日子，嫣嫣姑娘的孪生妹妹曾来过这里……")
    situ:say("孪生妹妹？是谁？")
    laoyu:say("她叫苏莺莺，因声音如同夜莺般婉转而得名。")
    hide_all_stage_bubble()
    wait_twn(laoyu:flip(), laoyu:movetoX(2500))
    situ:say("苏莺莺？难道是她？")
    set_flag("完成苏莺莺线索")
else
    situ:say("嫣嫣姑娘，幸不辱命，我已经将小红找到，她现在安全无恙。过几天就回得月楼。")
    wait_twn(suyanyan:flip(0.2), suyanyan:daze())
    suyanyan:say("公子，你一路辛苦了。找小红的过程中，一定经历了不少艰险吧？")
    situ:say("些许波折而已，不值一提。原来都是豪猪长垄在搞鬼，他们把女儿村的女孩子抓走了，小红也是被他们抓走的。")
    suyanyan:say("豪猪长垄？又是这帮无恶不作的混蛋！他们屡次为恶，真是让人忍无可忍。")
    situ:say("没错，新仇旧恨，是时候一起清算这笔账了。我们不能让他们继续横行霸道，我们必须站出来，保护那些无辜的女子。")
    suyanyan:say("公子说得对，我们不能坐视不管。")
end


black_scene(0.25)
set_flag("完成三访得月楼")
hide_stage()
light_scene(0.25)
