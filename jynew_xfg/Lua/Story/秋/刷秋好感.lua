show_stage("瀑布.png", "酒香亭郊外")
light_scene(0.2)
play_bgm("Music/秋.wav")

local situ = actor("司徒来也")
local qiu = actor("秋")

--初始化位置和朝向
dark_all_actors()
situ:bright()situ:setPos(-400, 75)
situ:face_right()
qiu:face_right()
qiu:setPos(700, 75)

wait_twn(qiu:offsetX(300, 500),
        qiu:spring_scale(1.5, 1, 1, 0.2),
        qiu:daze(1),
        qiu:flip(),
        qiu:offsetX(-300, 500),
        qiu:spring_scale(1.5, 1, 1, 0.2),
        qiu:daze(1),
        qiu:flip(),
        qiu:offsetX(300, 500),
        qiu:spring_scale(1.5, 1, 1, 0.2),
        qiu:flip(),
        qiu:daze(1)
)

wait_twn(situ:offsetX(800), situ:daze())
situ:say("秋，你在这干嘛呢？")
qiu:say("……")
situ:say("秋兄，你在这练武啊！")
qiu:say("呼～呼～")
situ:say("来，我们切磋一下！")
hide_all_stage_bubble()

--战斗
local startParam = {
    Team1 = {
        { Pos = 3, Role = get_role_by_id("司徒来也") },
    },
    Team2 = {
        { Pos = 3, Role = get_role_by_id("秋") },
    },
    MaxTurn = 99,
    BattleName = "找秋练武",
    IsQuick = false,
    PlayerTeam = 0,
    DisableJoinBattleCount = true,
    IsAskForPlayerFormation = false,
    Scene = "BatteMaps/BattleScenes/jyx2_7.unity",
    BGM = "Music/战斗2.wav",
}
local ret = start_battle(startParam)
if ret == 1 then
    situ:say("哈哈哈！秋，你还是不是我的对手！")
    qiu:say("……")
else
    qiu:say("哈……哈")
    situ:say("秋，你越来越厉害了！")
end

qiu:say("药……给你")
add_player_item("苍狼丹", 1)
change_favor_by_id("秋", 1)

black_scene(0.25)
hide_stage()
light_scene(0.25)
