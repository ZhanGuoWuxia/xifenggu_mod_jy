show_stage("bg_219.png", "虎焰门大堂")
light_scene(0.2)
play_bgm("Music/密谋_夜郎.wav")

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")


--初始化位置和朝向
bright_all_actors()
situ:setPos(500, 75)
situ:face_right()
qiliuge:setPos(2000, 75)
qiliuge:face_left()

wait_twn(qiliuge:offsetX(-1200), qiliuge:daze())

qiliuge:say("掌门，掌门，大事不妙！")
qiliuge:say("龙湾门少主杀至，声称要一决高下！")
situ:say("我不是已以金蝉脱壳之计，用肉包子打发了那群饿狼？")
qiliuge:say("此次来的仅一位少年，却点名要挑战掌门您。")
situ:say("乳臭未干的小子，也敢在太岁头上动土？我这就去会会他。")
hide_all_stage_bubble()

situ:offsetX(3000)
wait_twn(qiliuge:flip(), qiliuge:daze(), qiliuge:offsetX(3000))

black_scene(0.25)
hide_stage()

show_stage("虎焰山树林.png", "虎焰山树林")
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
local dongfangli = actor("东方狸")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-300, 75)
situ:face_right()
qiliuge:setPos(-600, 75)
qiliuge:face_right()
dongfangli:setPos(1300, 75)
dongfangli:face_left()

situ:movetoX(800)
wait_twn(qiliuge:movetoX(500), qiliuge:daze())

dongfangli:say("你就是(player:fullname)？敢不敢与我一较高下？")
situ:say("你是哪位？")
dongfangli:say("少逞口舌之快，记住你今日败给的是东方狸。")
hide_all_stage_bubble()

--战斗
local startParam = {
    Team1 = {
        { Pos = 3, Role = get_role_by_id("司徒来也") },
    },
    Team2 = {
        { Pos = 3, Role = get_role_by_id("东方狸") },
    },
    MaxTurn = 99,
    BattleName = "单枪匹马之战",
    IsQuick = false,
    PlayerTeam = 0,
    DisableJoinBattleCount = true,
    IsAskForPlayerFormation = false,
    Scene = "BatteMaps/BattleScenes/jyx2_3.unity",
    BGM = "Music/热血_侠肝义胆.wav",
    -- BattleTriggers = {"子瑾风开局", "子瑾风大招"}
}
local ret = start_battle(startParam)
if ret == 1 then
  dongfangli:say("哼，确有过人之处，但也不少破绽！")
  situ:say("回去跟你们龙湾门的人说，虎焰门不是好欺负的。")
else
  situ:say("可恶，年纪不大却有如此实力……")
  dongfangli:say("虎焰门没几天好日子过了。")
end

set_both_friendship("player", "龙湾门", -100)

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成被单枪匹马")
light_scene(0.25)
