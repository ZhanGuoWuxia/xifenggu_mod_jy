local faction = require("Common/faction")

show_battle_route("龙湾", "海狸湾")

avg_talk("东方骤雨", "孩儿们，让虎焰门见识一下，什么叫做真正的力量！")

set_flag("完成东方骤雨中计")

show_stage("海狸湾.png", "海狸湾")
light_scene(0.2)
play_bgm("Music/密谋_夜郎.wav")

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
local dongfangzhouyu = actor("东方骤雨")
local dongfangli = actor("东方狸")
local dongfangtun = actor("东方豚")

--初始化位置和朝向
bright_all_actors()
situ:setPos(700, 75)
situ:face_right()
qiliuge:setPos(400, 75)
qiliuge:face_right()
dongfangzhouyu:setPos(2000, 75)
dongfangzhouyu:face_left()
dongfangtun:setPos(2300, 75)
dongfangtun:face_left()
dongfangli:setPos(2600, 75)
dongfangli:face_left()

--先一起走过去
dongfangzhouyu:movetoX(1000)
dongfangtun:movetoX(1300)
wait_twn(dongfangli:movetoX(1600), dongfangli:daze())

dongfangzhouyu:say("你父亲当年在我拳下败走，今日，我东方骤雨便要让你父债子偿。")
situ:say("虎焰门与龙湾门的恩怨情仇，就让我们一战解决。")
hide_all_stage_bubble()
--战斗
local ai = aiManager:getAI("AI/Menpai/龙湾门")
local startParam = {
    Team2 = {
        { Pos = 0, Role = ai:get_role_of_class("刺客") },
        { Pos = 1, Role = ai:get_role_of_class("侠士") },
        { Pos = 2, Role = get_role_by_id("东方豚") },
        { Pos = 3, Role = ai:get_role_of_class("铁卫")  },
        { Pos = 4, Role = get_role_by_id("东方骤雨") },
        { Pos = 5, Role = get_role_by_id("东方狸") },
        { Pos = 6, Role =  ai:get_role_of_class("刺客")  },
        { Pos = 7, Role = ai:get_role_of_class("侠士")},
        { Pos = 8, Role = ai:get_role_of_class("医师")},
    },
    MaxTurn = 99,
    BattleName = "东方骤雨全力突击海狸湾",
    IsQuick = false,
    PlayerTeam = 0,
    DisableJoinBattleCount = true,
    Scene = "BatteMaps/BattleScenes/jyx2_3.unity",
    BGM = "Music/热血_侠肝义胆.wav",
}
local ret = start_battle(startParam)
local isPlayerWin = ret == 1
if isPlayerWin then
    situ:say("东方老贼，你也不过如此。龙湾门还是这么不堪一击。")
    dongfangtun:say("你少嚣张！总有一天，我要你好看！")
    dongfangli:say("今日气势已破，我们来日再战！")
    dongfangzhouyu:say("撤！别再丢脸了！")
    hide_all_stage_bubble()
    dongfangli:flip()
    dongfangli:movetoX(3000)
    dongfangtun:flip()
    dongfangtun:movetoX(3000)
    dongfangzhouyu:flip()
    wait_twn(dongfangzhouyu:movetoX(3000))
else
    qiliuge:say("掌门，快撤！")
    situ:say("大家撤退！")
    hide_all_stage_bubble()
    qiliuge:flip()
    qiliuge:movetoX(-500)
    situ:flip()
    wait_twn(situ:movetoX(-500))
    if not faction.is_faction_of_area("龙湾门", "海狸湾") then
        occupy_area("龙湾门", "海狸湾")
    end
    dongfangzhouyu:say("哈哈哈，痛快！这虎焰门余孽还得我亲自来收拾。")
    dongfangtun:say("父亲神勇！我们回龙湾好好庆功一番。")
end


hide_all_stage_bubble()
black_scene(0.25)
hide_stage()
light_scene(0.25)


if isPlayerWin then
    avg_talk("司徒来也", "哈哈，东方老贼，你自诩为龙湾门的掌门，却连自己的后院都守不住了。")
    avg_talk("东方骤雨", "什么？！你说什么？龙湾门的根基，岂是你这等鼠辈所能撼动的。")
    avg_talk("司徒来也", "后院起火，夫人反目，你这掌门的威严何在？东方老贼，你还是先回去处理家务事吧。")
else
    avg_talk("龙湾门下人", "掌门，大事不好了，夫人率众起义了！")
    avg_talk("龙湾门下人", "夫人带着大少爷和厨子老宋一起，趁我门内空虚，已经占领了多处。")
    avg_talk("东方骤雨", "什么？！这……这怎么可能……这个贱人竟敢背叛我！")
    avg_talk("东方骤雨", "快，退守海狸湾，我东方骤雨绝不能让龙湾门落入他人之手。")
end


--分地了
local areas = areas_of_menpai("龙湾门")
for _, area in pairs(areas) do
    if area.Id == "海狸湾" then
        -- do nothing
    elseif area.Id == "龙湾" or area.Id == "海鲨湾" then
        occupy_area("食为鲜", area)
        wait_for_seconds(1.5)
    else
        player_occupy_area(area)
        wait_for_seconds(1.5)
    end
end
