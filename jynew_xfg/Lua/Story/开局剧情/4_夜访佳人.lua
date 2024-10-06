show_stage("得月楼.png", "得月楼")
set_bg_mat("ImgPaperFold")
play_bgm("Music/抒情_柔情似水.wav", 0.5)
light_scene(0.25)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
local suyanyan = actor("苏嫣嫣")
local liangsheng = actor("梁胜")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(900, 75)
situ:face_right()
suyanyan:setPos(1200, 75)
suyanyan:face_left()
qiliuge:setPos(-500, 75)
qiliuge:stylize("Silhouette")
qiliuge:setOverrideName("？？？")
qiliuge:face_right()
liangsheng:setPos(700, -500)
liangsheng:stylize("Silhouette")
liangsheng:setOverrideName("？？？")
liangsheng:face_right()

suyanyan:say("公子，此计当真可行？")
situ:say("瞧你说的，小爷我干什么来的？")
suyanyan:say("可那<color=red>豪猪长垄</color>也非泛泛之辈，只怕……")
situ:emotion("DaXiao")
situ:say("哈哈哈——")
situ:emotion()
suyanyan:say("公子为何忽然发笑？")
situ:emotion("WeiXiao")
situ:say("小爷我是笑苏姑娘你啊！")
situ:emotion()
suyanyan:say("奴家？")
situ:say("苏姑娘，你那日对付豪猪长垄的那帮山猪动刀子时那股狠劲儿呢？")
suyanyan:say("那时是因姐妹受辱，一时情急……")
situ:jump()
situ:flip()
situ:emotion("NaoHuo")
situ:say("那么，苏姑娘，你这是信不过小爷我喽？")
suyanyan:say("公子侠肝义胆，奴家岂敢有疑？只是担心万一计划败露，豪猪长垄的报复……")
situ:emotion()
suyanyan:say("公子为得月楼的姐妹出头，若因此惹怒这起子歹人……")
situ:flip()
situ:emotion("LengKu")
situ:say("放心，小爷自有分寸。豪猪长垄之辈，不过是跳梁小丑，何足挂齿。")
situ:emotion()
wait_twn(suyanyan:offsetY(-50), suyanyan:daze())
suyanyan:say("那么奴家就代得月楼的姐妹们先行谢过啦。")
suyanyan:offsetY(50)
situ:emotion("BeiShang")
situ:say("何必多礼？不过是举手之劳。待会儿见了那些人，你可要演得入木三分，别露了马脚。")
situ:emotion()
wait_twn(qiliuge:movetoX(100), qiliuge:daze())
qiliuge:say("人呢？")
situ:say("有人来了！苏姑娘，依计行事，我会与你配合。")
hide_all_stage_bubble()
wait_twn(situ:hide(), suyanyan:hide(), situ:moveTo(1500, -500), situ:flip(), suyanyan:moveTo(900, -500), suyanyan:flip())
wait_twn(qiliuge:movetoX(500))
wait_twn(suyanyan:show(), suyanyan:jumpTo(900, 75))
suyanyan:say("来了！")
hide_all_stage_bubble()
suyanyan:movetoX(3000)
wait_twn(qiliuge:movetoX(1000), qiliuge:daze())
qiliuge:say("人怎么跑了？")
wait_twn(situ:show(), situ:jumpTo(1200, 75))
situ:shake_bubble(65, 0.8)
situ:shake(65, 0.8)

play_sfx("Story/Fist.mp3")
situ:say("臭山猪！看我怎么收拾你！")
qiliuge:shake(65, 0.8)
qiliuge:say("哎！哎呦！好汉饶命！饶命啊！")
situ:say("这声音……")
situ:say("齐六哥？！……")
situ:say("不是豪猪长垄的人渣何猛吗？怎么会是你？")
qiliuge:stylize()
qiliuge:setOverrideName("齐六哥")
qiliuge:emotion("JingYa")
qiliuge:say("大少爷！先别管什么“河猛”、“海猛”的了，夫人那边，才是真生猛啊！")
situ:emotion("JingYa")
situ:shake()
situ:say("我爹不是说帮我打掩护吗，难道事情已被娘知晓？")
situ:shake()
situ:emotion()
qiliuge:jump()
qiliuge:say("嗨呀！小祖宗，你还是先想想如何回府，向夫人交代吧！")
qiliuge:emotion()
hide_all_stage_bubble()
situ:jump()
situ:movetoX(-500)
qiliuge:flip()
wait_twn(qiliuge:jump(), qiliuge:movetoX(-500))
stop_bgm(0.5)
wait_for_seconds(1)
wait_twn(liangsheng:jumpTo(700, 75), liangsheng:offsetX(250))
liangsheng:stylize()
liangsheng:setOverrideName("梁胜")
liangsheng:say("桀桀桀，轮到我上场了！好戏要开场咯。")
wait_twn(hide_all_stage_bubble(), liangsheng:movetoX(3000))

black_scene(0.25)
hide_stage()

show_stage("得月楼后堂.png", "得月楼后堂")
set_bg_mat("ImgPaperFold")
play_bgm("Music/豪猪恶贼.wav", 1)
light_scene(0.25)

local liangsheng = actor("梁胜")
local suyanyan = actor("苏嫣嫣")
local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
liangsheng:setPos(-500, 75)
liangsheng:face_right()
suyanyan:setPos(1400, 75)
suyanyan:face_left()
situ:setPos(1200, -500)
situ:face_left()
qiliuge:setPos(1400, -500)
qiliuge:face_left()

wait_twn(liangsheng:movetoX(900), liangsheng:daze())
liangsheng:say("桀桀桀，小娘子，相公我来了。竟敢和那帮孙子一起下套！还想暗算你相公我？看老子怎么治你！")
suyanyan:say("梁胜，你这恶贼！得月楼姑娘不少被你们豪猪山匪欺负！")

situ:jumpTo(900, 75)
qiliuge:jumpTo(1100, 75)
wait_twn(liangsheng:jumpTo(600, 75), situ:daze())
situ:say("哈哈！六哥这手“将计就计”真是妙到毫巅，竟让这厮自投罗网！")
play_bgm("Music/日常_烟火人间.wav", 1)
qiliuge:say("大少爷，自郊外起我便察觉了他的踪迹，这一出戏，你我配合得天衣无缝，叫他自投罗网。")
liangsheng:say("可……可恶，中计了么？")
liangsheng:say("无妨，今日要让你们见识我豪猪长垄“毒眼儿”的厉害！")
qiliuge:say("大少爷，且让我来会一会这恶贼！")
suyanyan:say("公子，嫣嫣虽是女子，却当助一臂之力！")
situ:say("好！今日我们便一起试试这豪猪山寨的斤两！")
hide_all_stage_bubble()
--战斗
local startParam = {
    Team1 = {
        { Pos = 3, Role = get_role_by_id("齐六哥") },
        { Pos = 4, Role = get_role_by_id("司徒来也") },
        { Pos = 5, Role = get_role_by_id("苏嫣嫣") },
    },
    Team2 = {
        { Pos = 3, Role = create_temp_role("梁胜_新手关") },
        { Pos = 4, Role = create_temp_role("豪猪土匪_新手关") },
    },
    MaxTurn = 99,
    BattleName = "得月楼后堂之战",
    IsQuick = false,
    PlayerTeam = 0,
    DisableJoinBattleCount = true,
    IsAskForPlayerFormation = false,
    Scene = "BatteMaps/BattleScenes/jyx2_7.unity",
    BattleTriggers = {"手动战斗教学", "施展技能教学"}
}
local ret = start_battle(startParam)
if ret == 1 then
    situ:jumpTo(700, 75)
    play_sfx("Story/SlashAttack.mp3")
    wait_twn(liangsheng:jumpTo(500, 30), liangsheng:daze())
    liangsheng:say("啊——我的眼……")
    role_add_affix("梁胜", "独眼")
    pop_tip(string.i18_format("{0}获得了{1}", "梁胜", affix_tip_link("独眼", "独眼", "#00A5FF")))
    situ:say("这只是小小的教训，让你明白天外有天！")
    qiliuge:say("毒眼儿？独眼儿！这名字倒是与你相配。")
    liangsheng:say("你……你们……")
    situ:say("还有胆量再来一次？")
    liangsheng:say("不……不敢了……")
    situ:say("那就滚！")
    liangsheng:flip()
    situ:say("且慢！我是说“滚”！")
    liangsheng:flip()
    liangsheng:say("虎焰门……莫要太过分……")
    situ:say("那你另一只眼睛也不想要了咯？")
    liangsheng:say("好……算你狠！我滚……")
    hide_all_stage_bubble()
    liangsheng:flip()
    liangsheng:rotatetoZ(360)
    wait_twn(liangsheng:movetoX(-500))
    situ:flip()
    situ:say("苏姑娘，此后得月楼不必再惧怕这些宵小之徒。只是，你暂且闭门谢客，避一避风头。")
    suyanyan:say("公子恩情，嫣嫣铭记。")
    qiliuge:say("这下糟了，夫人叮嘱过不可轻易动手，这该如何是好？")
    situ:say("走一步看一步，六哥，跟我来！")
    black_scene(0.25)
    hide_stage()
    set_flag("完成夜访佳人")
    light_scene(0.25)
    executefile("Guide/暗度陈仓_引导")
else
    hide_stage()
    game_over()
end
