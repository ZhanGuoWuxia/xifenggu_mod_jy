show_stage("百草清涧.png", "虎焰门郊外")
set_bg_mat("ImgPaperFold")
play_bgm("Music/豪猪恶贼.wav")
light_scene(0.25)

local situ = actor("司徒来也")
local nvzi= actor("[speaker:求助的少女][img:ai2_female_18]")
local liangsheng = actor("梁胜")
local dizi1 = actor("豪猪长垄弟子")
local dizi2 = actor("豪猪长垄弟子二")
local dizi3 = actor("豪猪长垄弟子三")
local liuming = actor("刘明")
local zsniang = actor("朱三娘")
local xuemolaozu = actor("血魔老祖")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(600, 75)
situ:face_right()
nvzi:setPos(2200, 75)
nvzi:face_left()
liangsheng:setPos(2400, 75)
liangsheng:face_left()
dizi1:setPos(2600, 75)
dizi1:face_left()
dizi2:setPos(2800, 75)
dizi2:face_left()
dizi3:setPos(3000, 75)
dizi3:face_left()
liuming:setPos(-400, 75)
liuming:face_right()
zsniang:setPos(-700, 75)
zsniang:face_right()
xuemolaozu:setPos(-400, 75)
xuemolaozu:face_right()

wait_twn(nvzi:movetoX(900), nvzi:daze())
nvzi:say("救命啊！救命啊！")
situ:emotion("KunHuo")
situ:say("姑娘莫慌，究竟发生了何事？")
situ:emotion()
nvzi:say("小女子家在酒香亭，豪猪长垄的人突然来袭，家人……家人都……")
if has_flag("完成血魔再现") then
    nvzi:say("之前小碧被歹人掳去，在虎焰山得救，我因此前来求救。")
else
    nvzi:say("不知怎么我一直跑，跑到了虎焰堂。")
end

dizi1:movetoX(1400)
dizi2:movetoX(1600)
dizi3:movetoX(1800)
wait_twn(liangsheng:movetoX(1200), liangsheng:daze())
liangsheng:say("潘二哥说了，酒香亭的人一个都不能留！弟兄们！给我搜！")
situ:emotion("NaoHuo")
situ:say("放肆！全都给我住手！")
liangsheng:say("呦？这不是虎焰门家的少爷吗？虎焰门都已经死光光了，还在这里逞什么英雄？")
situ:emotion()
hide_all_stage_bubble()
local options = {
    "将少女挡在身后",
    "静观其变，不动声色",
}
local idx = show_quick_selections(options)
if idx == 1 then
    wait_twn(situ:movetoX(900), nvzi:jumpTo(750, 75), nvzi:flip())
    liangsheng:say("哟哟哟，英雄救美呢，就凭你？")
    wait_twn(liuming:movetoX(400))
    zsniang:movetoX(200)
    liuming:say("呸！虎焰门还轮不到你们这帮臭豪猪看低！")
    situ:say("动手救人！")
    hide_all_stage_bubble()
    --战斗
    local ret = start_preset_battle("阻止梁胜")
    if ret == 1 then
        liangsheng:say("妈的，今日算你们厉害。好汉不吃眼前亏，撤！")
        hide_all_stage_bubble()
        liangsheng:flip()
        dizi1:flip()
        dizi2:flip()
        dizi3:flip()
        liangsheng:movetoX(3000)
        dizi1:movetoX(3000)
        dizi2:movetoX(3000)
        dizi3:movetoX(3000)
        situ:flip()
        situ:say("都没事吧？")
        nvzi:say("多谢恩人相救！")
        zsniang:say("掌门，见这情势，只怕那些人是冲着酒香亭去的。")
        nvzi:say("酒香亭还有很多人被他们抓走了，求求恩人帮帮我们吧！")
        situ:say("你放心！虎焰门岂会见死不救？")
        set_flag("完成阻止梁胜抢劫少女")
        set_flag("开启收复失地")
    else
        if has_flag("完成血魔再现") then
            play_bgm("Music/血魔老祖.wav")
            wait_twn(xuemolaozu:movetoX(600), xuemolaozu:daze())
            xuemolaozu:say("哈哈哈！似乎有架打，老夫也来凑凑热闹！")
            situ:flip()
            situ:emotion("JingYa")
            situ:say("血魔前辈，你怎么在这？")
            situ:emotion()
            xuemolaozu:say("哈哈哈！老夫最爱看人打架。有趣！有趣的很哪！")
            liangsheng:say("哪里来的老东西？也罢，无非是多口棺材。来呀！给我上！")
            xuemolaozu:say("刚好试试老夫新练的“搜魂大法”。来，小娃娃，让我来控制你，把这帮不知天高地厚的家伙打得满地找牙！")
            situ:flip()
            situ:emotion("NaoHuo")
            situ:say("我体内的血气正在翻涌沸腾，啊！")
            hide_all_stage_bubble()
            local player = get_player_role()
            local role = create_temp_role("司徒来也_控制")
            role:ChangeName(player.CustomFamilyName, player.CustomGivenName)
            --战斗
            local param = {
                Team1 = {
                    { Pos = 3, Role = role },
                },
                Team2 = {
                    { Pos = 1, Role = create_temp_role("豪猪土匪") },
                    { Pos = 3, Role = get_role_by_id("梁胜") },
                    { Pos = 7, Role = create_temp_role("豪猪土匪") },
                    { Pos = 5, Role = create_temp_role("豪猪弓箭手_精") },
                },
                MaxTurn = 99,
                BattleName = "搜魂大法之战",
                IsQuick = false,
                PlayerTeam = 0,
                DisableJoinBattleCount = true,
                IsAskForPlayerFormation = false,
                Scene = "BatteMaps/BattleScenes/HuYanMen_0.unity",
                BattleTriggers = {"司徒来也_控制开局"},
                RolesAIMustControl = {"司徒来也_控制"},
            }
            local r = start_battle(param)
            if r == 1 then
                dizi1:say("啊——妈呀，这家伙怎么变得这么厉害！")
                wait_twn(dizi1:movetoY(-600, 5000))
                situ:say("杀杀杀！")
                liangsheng:say("妈的，这家伙突然跟疯狗一样，快撤快撤！")
                hide_all_stage_bubble()
                liangsheng:flip()
                dizi2:flip()
                dizi3:flip()
                liangsheng:movetoX(3000)
                dizi2:movetoX(3000)
                dizi3:movetoX(3000)
                situ:flip()
                situ:emotion()
                situ:say("（冷静过来）果然被控制了，不是我自己凶残。")
                if is_equip_skill("司徒来也", "血河大法") then
                    xuemolaozu:say("哈哈哈！小娃娃，老夫看你已经习得我《血河大法》，不如拜我为师如何？")
                    situ:emotion("JingYa")
                    situ:say("这功法居然是你故意留下的……所以我才能被你控制？")
                    situ:emotion()
                    xuemolaozu:say("哈哈哈！小娃娃，见你豪烈不羁，分明是天生的魔种。老夫在山洞中修炼，你若有意，可来拜访。")
                else
                    xuemolaozu:say("哈哈哈！小娃娃，老夫看你不错，不如拜我为师如何？")
                    situ:say("血魔前辈，多谢抬爱，只是正邪不两立，还望不要为难晚辈才好。")
                    xuemolaozu:say("哈哈哈！小娃娃倒是直率！老夫在山洞中修炼，你若有意，可来拜访。")
                end
                hide_all_stage_bubble()
                xuemolaozu:movetoX(3000)
                situ:say("都没事吧？")
                nvzi:say("多谢恩人相救！")
                zsniang:say("掌门，见这情势，只怕那些人是冲着酒香亭去的。")
                nvzi:say("酒香亭还有很多人被他们抓走了，求求恩人帮帮我们吧！")
                situ:say("你放心！虎焰门岂能坐视不理？")
                set_flag("完成阻止梁胜抢劫少女")
                set_flag("开启收复失地")
            else
                wait_twn(situ:jumpTo(600, 30))
                situ:emotion("BeiShang")
                situ:say("可恶！竟输给了这帮歹人！")
                situ:emotion()
                xuemolaozu:say("小娃娃，你的功夫，可差得远呢！这样打架，好没意思！不看也罢！")
                xuemolaozu:movetoX(3000)
                liangsheng:say("哼，人多又怎么样？丧家之犬还想抵抗？这次便是教训，以后少来多管闲事！")
                liangsheng:flip()
                liangsheng:offsetX(-200)
                wait_twn(liangsheng:offsetY(-60), liangsheng:offsetY(60, 300))
                wait_twn(nvzi:jumpTo(900, 130))
                liangsheng:say("带上那个小娘们！兄弟们，也不早了，回吧！")
                hide_all_stage_bubble()
                liangsheng:movetoX(3000)
                nvzi:movetoX(3000)
                dizi1:flip()
                dizi2:flip()
                dizi3:flip()
                dizi1:movetoX(3000)
                dizi2:movetoX(3000)
                dizi3:movetoX(3000)
                situ:say("……")
            end
        else
            wait_twn(situ:jumpTo(600, 30))
            situ:emotion("BeiShang")
            situ:say("可恶！竟输给了这帮歹人！")
            situ:emotion()
            liangsheng:say("哼，人多又怎么样？丧家之犬还想抵抗？这次便是教训，以后少来多管闲事！")
            liangsheng:flip()
            liangsheng:offsetX(-200)
            wait_twn(liangsheng:offsetY(-60), liangsheng:offsetY(60, 300))
            wait_twn(nvzi:jumpTo(900, 130))
            liangsheng:say("带上那个小娘们！兄弟们，也不早了，回吧！")
            hide_all_stage_bubble()
            liangsheng:movetoX(3000)
            nvzi:movetoX(3000)
            dizi1:flip()
            dizi2:flip()
            dizi3:flip()
            dizi1:movetoX(3000)
            dizi2:movetoX(3000)
            dizi3:movetoX(3000)
            situ:say("……")
        end
    end
elseif idx == 2 then
    liangsheng:say("呦，不吱声？丧家之犬倒是还挺明白情势。")
    situ:say("你把小姑娘放了，此事就此揭过！")
    liangsheng:say("算了吧，潘二哥说了，你们虎焰门早完了，还是识相点，省得老子上手。")
    situ:say("你敢造次？")
    liangsheng:flip()
    liangsheng:offsetX(-200)
    liangsheng:say("你敢动手？老子手里的家伙可不长眼！")
    wait_twn(liangsheng:offsetY(-60), liangsheng:offsetY(60, 300))
    wait_twn(nvzi:jumpTo(900, 130))
    nvzi:say("放开我！")
    situ:say("若是真汉子便堂堂正正，挟持小姑娘算什么东西！")
    liangsheng:say("老子我再不是东西，那也是你老子！潘二哥说了，此番只为灭了酒香亭，我可不敢为了你这条败家犬生了枝节。")
    liangsheng:say("兄弟们，带着那小娘们！撤吧！")
    hide_all_stage_bubble()
    liangsheng:movetoX(3000)
    nvzi:movetoX(3000)
    dizi1:flip()
    dizi2:flip()
    dizi3:flip()
    dizi1:movetoX(3000)
    dizi2:movetoX(3000)
    dizi3:movetoX(3000)
    situ:say("站住！可恶！")
end

hide_all_stage_bubble()
black_scene(0.25)
hide_stage()
set_flag("完成求助的少女")
if not has_flag("完成抵抗偷袭") and has_flag("完成阻止梁胜抢劫少女") then
    pop_tip("你现在可以通过 <color=red>收复失地</color> 快速占领地块了")
end
light_scene(0.25)
