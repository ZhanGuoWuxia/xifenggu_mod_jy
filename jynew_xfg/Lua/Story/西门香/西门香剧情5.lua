
show_stage("西门香的房间.png", "西门香的房间")
play_bgm("Music/西门香.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local npc = actor("西门香")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1200, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(900), situ:daze())

npc:say("大掌门，再陪我练练剑如何？")
situ:say("香儿，呃……我突然有点想去吃包子，要不还是改天？")
play_sfx("Skills/Wuxia/blade_2.mp3")
npc:say("休走，看剑！")

hide_all_stage_bubble()
--战斗
local startParam = {
    Team1 = {
        { Pos = 3, Role = get_role_by_id("司徒来也") },
    },
    Team2 = {
        { Pos = 3, Role = get_role_by_id("西门香") },
    },
    MaxTurn = 99,
    BattleName = "西门香剧情5",
    IsQuick = false,
    PlayerTeam = 0,
    DisableJoinBattleCount = true,
    IsAskForPlayerFormation = false,
    Scene = "BatteMaps/BattleScenes/jyx2_7.unity",
    BGM = "Music/热血_侠肝义胆.wav",
}
local ret = start_battle(startParam)
if ret == 1 then
    situ:say("香儿，今日侥幸赢了一局。")
    npc:say("痛快痛快，再来一场吧，我定要扳回一城！")
else
    situ:say("香儿，你的剑法不凡，我败得心服口服。")
    npc:say("嘿嘿，大掌门也不赖~")
end
situ:say("香儿，今日咱们已经来来回回比试过多场，该休息了。要不咱们去三娘那吃点东西……？")
npc:say("(player:fname)掌门这是要逃之夭夭吗？我还有话要说呢！")
situ:say("你说……")
npc:say("我发现我们两家的武学，虽然一用刀，一用剑，却似有同源。若能将二者融合，或能突破当下境界……")
situ:say("香儿，你……确实是个武学奇才！")

stage_narration("西门香认真的看着一刀一剑，陷入沉思……")

hide_all_stage_bubble()

change_favor_by_id("西门香", 1)

black_scene(0.25)
hide_stage()
set_flag("完成西门香剧情5")
light_scene(0.25)
