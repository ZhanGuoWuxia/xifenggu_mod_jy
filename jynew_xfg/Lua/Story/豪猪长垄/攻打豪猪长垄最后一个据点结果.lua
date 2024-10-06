show_stage("夜晚豪猪长垄.png", "豪猪长垄")
light_scene(0.2)
play_bgm("Music/决心_仗剑天涯.wav")

local tangcaidie = actor("汤彩蝶")
local hemeng = actor("何猛")
local panmazi = actor("潘麻子")
local liangsheng = actor("梁胜")
local situ = actor("司徒来也")
local tangbainiu = actor("汤白牛")

--判断是否有汤白牛
local battle_param = current_battle_param
local is_ok = battle_param:IsInTeam1("汤白牛")

--初始化位置和朝向
bright_all_actors()
hemeng:setPos(800, 75)
hemeng:face_right()
panmazi:setPos(500, 75)
panmazi:face_right()
liangsheng:setPos(300, 75)
liangsheng:face_right()
tangcaidie:setPos(1400, 75)
tangcaidie:face_left()
situ:setPos(1200, 75)
situ:face_left()
if is_ok then
    tangbainiu:setPos(1700, 75)
    tangbainiu:face_left()
else
    tangbainiu:hide()
end

local win_ret = current_win_ret
if win_ret == 1 then
    if is_ok then
        tangbainiu:say("阿姊，你安然无恙，真是太好了！")
        tangcaidie:say("阿弟！真的是你！")
    end
    hemeng:say("二弟，三弟，你们快走！豪猪长垄的事我一人担着。")
    liangsheng:say("老大，做兄弟的，有今生没来世！")
    panmazi:say("走！留着青山在，不怕没柴烧！")
    liangsheng:flip()
    liangsheng:movetoX(-500)
    panmazi:flip()
    wait_twn(panmazi:movetoX(-500))
    situ:say("何猛！一切结束了，快把姑娘们都放了！")
    hemeng:say("哼！说得冠冕堂皇，怕是眼馋这些娘们儿，想要就拿去，装什么正人君子？")
    situ:say("谁同你一般！我是替天行道！")
    hemeng:say("替天行道？笑话！天若有道，我何猛又何以至此？")
    hide_all_stage_bubble()
    local idx = show_avg_select("", "何猛似是话里有话，是否留下活口？", { "此人奸诈，定是狡辩之言，立斩不赦！", "人之将死其言也善，不如听他分辩，再做决断。" })
    if idx == 1 then
        situ:say("多行不义必自毙，息风谷可容不下你这等恶徒！")
        hemeng:say("哈哈哈！能拖这么多人下地府，老子也不算亏！")
        hide_all_stage_bubble()
        hemeng:offsetY(-300)
        set_flag("完成斩杀何猛")
        add_player_item("绝命刀", 1)
        add_player_item("十全大补丸", 3)
        add_player_item("九转仙露", 1)
    elseif idx == 2 then
        situ:say("没想到你死到临头，倒是干脆！")
        hemeng:say("想我一世虽称不上英雄，但也算快意，不亏，不亏！")
        situ:say("你倒还算明白！只可惜这快意过了头，变成了追命的杀意！")
        hemeng:say("哈哈哈，哈哈哈哈！")
        situ:say("将死之人，你笑什么？")
        hemeng:say("我笑你，明白这些道理，却还是没保住虎焰门！你说好笑不好笑？")
        situ:say("你这话什么意思？你是不是知道些什么？")
        hemeng:say("要杀就杀，废什么话？动作痛快些，老子少受些苦！")
        situ:say("你想一死了之？可没那么容易！且留你一命，这些血债还要你亲自来还！")
        --劈砍特效
        situ:movetoX(1000, 5000)
        wait_twn(hemeng:jumpTo(700, 30), hemeng:daze())
        hemeng:say("你——啊！")
        situ:say("如今断了你的孽根，也算是你糟蹋那些姑娘的报应！")
        role_add_affix("何猛", "去势")
        pop_tip(string.i18_format("{0}获得了{1}", "何猛", affix_tip_link("去势", "去势", "#00A5FF")))
        hemeng:say("你……")
        situ:say("如今你武功废了，身子也废了。暂且留你这条贱命，好好反省吧！")
        hemeng:say("虎焰门！我何猛……记下了……")
        hide_all_stage_bubble()
        add_player_item("豪猪甲", 1)
        add_player_item("十全大补丸", 3)
        add_player_item("九转仙露", 1)
        set_flag("完成释放何猛")
    end
    destroy_menpai("豪猪长垄")
else
    situ:say("野山猪！胆敢暗下黑手！")
    hemeng:say("哈哈，你最好滚远点，小心老子把你给捏碎了！")
end

black_scene(0.25)
hide_stage()
light_scene(0.25)
