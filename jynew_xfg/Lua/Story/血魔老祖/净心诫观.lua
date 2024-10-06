show_stage("虎焰山山洞.png", "虎焰山山洞")
set_bg_mat("ImgPaperFold")
play_bgm("Music/血魔老祖.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local xuemolaozu = actor("血魔老祖")
local zijinfeng = actor("子瑾风")
zijinfeng:setScale(1.1)
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
zijinfeng:setPos(700, 75)
zijinfeng:face_right()
situ:setPos(1000, 30)
situ:face_right()
xuemolaozu:setPos(1300, 75)
xuemolaozu:face_left()

situ:standfront()
situ:spring_scale(1.5, 1, 1, 0.2)
xuemolaozu:say("(player:gname)，你的心魔已如烈火烹油，再不镇压，恐成大患。若不早日化解，只怕它会如蛆附骨，让你永无宁日。")
situ:spring_scale(1.5, 1, 1, 0.2)
situ:say("嗯————")
zijinfeng:say("师父，师弟此刻似已入魔渐深，我们该如何助他？")
xuemolaozu:say("瑾风，你与(player:gname)同出一门，心性相通，你内心纯洁，仁义为先，可以引导他找回内心的平静。")
xuemolaozu:say("老夫便在此为你们护法，确保一切无虞。")
wait_twn(zijinfeng:movetoX(800), zijinfeng:daze())
zijinfeng:say("是，师父！我便将内力注入师弟体内。")
xuemolaozu:say("(player:gname)，跟为师默念：“净心明镜，垢染渐灭。诫观自省，始除烦恼。”")
zijinfeng:say("师弟，集中精神，克制心魔。")
situ:spring_scale(1.5, 1, 1, 0.2)
situ:flip()
situ:jumpTo(800, 75)
wait_twn(zijinfeng:jumpTo(500, 75), zijinfeng:daze())
zijinfeng:say("……师弟的心魔太过强大，我似乎力有未逮。")
xuemolaozu:say("(player:gname)，直面心魔，心魔如镜，镜破则影消。")
situ:say("呼——我仿佛看到了。")
hide_all_stage_bubble()
local player = get_player_role()
print(player.Name)
local role = create_temp_role("司徒来也_心魔")
role:ChangeName(player.CustomFamilyName, player.CustomGivenName)
--战斗
local startParam = {
    Team1 = {
        { Pos = 3, Role = get_role_by_id("司徒来也") },
    },
    Team2 = {
        { Pos = 3, Role = role },
    },
    MaxTurn = 99,
    BattleName = "心魔之战",
    IsQuick = false,
    PlayerTeam = 0,
    DisableJoinBattleCount = true,
    IsAskForPlayerFormation = false,
    Scene = "BatteMaps/BattleScenes/jyx2_7.unity"
}
local ret = start_battle(startParam)
if ret == 1 then
    role_remove_affix("司徒来也", "走火入魔")
    pop_tip(string.i18_format("(player:fullname)失去了{0}", affix_tip_link("走火入魔", "走火入魔", "#BA00FF")))
    situ:flip()
    situ:say("师父，我好像恢复了。")
    xuemolaozu:say("(player:gname)，你不仅刺破了心魔，更是刺破了自己的枷锁。从此以后，你的武道之路必将更加宽广。")
    zijinfeng:say("师弟，恭喜你境界更上一层楼。")
    add_player_item("武学札记", 1)
    set_flag("完成净心诫观")
else
    situ:say("师父，我好像不能控制心魔！")
    xuemolaozu:say("(player:gname)，不必过于沮丧，为师暂时给你压制心魔。")
    zijinfeng:say("(player:fname)师弟，心魔非一日养成，自然也不可一蹴而就，待明日我们再来过！")
end

black_scene(0.25)
hide_stage()
light_scene(0.25)
