show_stage("禁地.png", "训练场")
set_bg_mat("ImgPaperFold")
play_bgm("Music/密谋_夜郎.wav")
light_scene(0.2)
local faction_control = require("Common/faction")

local other_menpais = get_unlocked_other_menpais(get_player_menpai())
--随机选择一个门派
local menpai = #other_menpais > 0 and table.pick_random(other_menpais) or nil
local enemies = faction_control.pick_random_template_roles(menpai, 1, 6)
if #enemies == 0 then
    table.insert(enemies, create_temp_role("随机坦克", 5))
end

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
local npcs = {}
for _, role in pairs(enemies) do
    local npc = actor(role.BeanId)
    table.insert(npcs, npc)
end

local roleNum = #npcs

--初始化位置和朝向
dark_all_actors()
set_all_actors_mat("ImgPaperFold")
situ:setPos(1200, 75)
situ:face_left()
qiliuge:setPos(-400, 75)
qiliuge:face_right()
for i, npc in ipairs(npcs) do
    npc:setPos(-700 - i * 200, 75)
    npc:face_right()
end

wait_twn(qiliuge:movetoX(900), qiliuge:daze())
qiliuge:say("掌门，不好了！有几名其他门派的人上门踢馆，态度嚣张，声称要挑战我们虎焰门！")
situ:say("哦？其他门派的英雄竟然光临我们虎焰门，真是难得啊。")
situ:say("走！我们去迎接这些“贵客”。")
for i = 1, roleNum - 1 do
    npcs[i]:movetoX(1100 - i * 200)
end
qiliuge:movetoX(1400)
qiliuge:flip()
wait_twn(npcs[roleNum]:movetoX(1100 - roleNum * 200), npcs[roleNum]:daze())
npcs[roleNum]:say("哈哈，想必这位就是虎焰门的掌门了吧？")
situ:say("贵派盛名，在下早有耳闻。既是切磋武艺，自当奉陪。")
situ:say("但在此地大打出手，恐惊扰了附近的百姓。不如我们点到为止，以武会友，如何？")
npcs[1]:say("哼，你们虎焰门的人就是这么胆小吗？不过，既然你们这么怕事，那就在这里切磋吧。")
situ:say("请赐教！")
hide_all_stage_bubble()
local startParam = {
    Team2 = ai_std_formation_roles(enemies),
    MaxTurn = 99,
    BattleName = "踢馆",
    IsQuick = false,
    PlayerTeam = 0,
    DisableJoinBattleCount = true,
    Scene = "BatteMaps/BattleScenes/HuYanMen_0.unity",
    BGM = "Music/热血_侠肝义胆.wav",
}
local ret = start_battle(startParam)
if ret == 1 then
    npcs[1]:say("虎焰门果然名不虚传，我学武不精，甘拜下风。")
    situ:say("承让!")
else
    npcs[1]:say("哼，虎焰门不过如此，告辞!")
    situ:say("……")
end

hide_all_stage_bubble()
for i = 1, roleNum - 1 do
    npcs[i]:flip()
    npcs[i]:movetoX(-500)
end
npcs[roleNum]:flip()
wait_twn(npcs[roleNum]:movetoX(-500))

if ret == 1 then
    local itemCount = math.random(1, #npcs)
    local itemId = table.pick_random({"手镯", "金项链"})
    add_player_item(itemId, itemCount)
else
    add_player_money(-100 * #npcs)
end

black_scene(0.25)
set_flag("该回合已经踢馆")
hide_stage()
light_scene(0.25)