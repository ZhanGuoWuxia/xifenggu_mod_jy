
show_stage("虎焰山树林.png", "虎焰山树林")
play_bgm("Music/ThunderRain.mp3", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
local dizi = actor("仙竹门翠竹使")
local duanxiaonian = actor("段小年")
local shaoyao = actor("芍药")

--初始化位置和朝向
bright_all_actors()

situ:setPos(400, 75)
situ:face_right()
qiliuge:setPos(200, 75)
qiliuge:face_right()
duanxiaonian:setOverrideName("？？？")
duanxiaonian:setPos(2200, 75)
duanxiaonian:face_left()
shaoyao:setPos(2400, 75)
shaoyao:face_left()
dizi:setPos(2600, 75)
dizi:face_left()

qiliuge:say("掌门，前方有人正在追逐，似乎事态紧急。")
situ:say("被追之人，似是一名女子。我们去看看究竟。")
wait_twn(duanxiaonian:movetoX(900), shaoyao:movetoX(1400), dizi:movetoX(1600), dizi:daze())
dizi:say("逆贼，速速交出姑获鸟之瓶！")
duanxiaonian:flip()
duanxiaonian:say("此瓶邪异非常，多少生灵因它而亡，你们难道不知其中的罪恶吗？")
shaoyao:say("姑获鸟之瓶乃是我南宫掌门完成救世大业的至宝，岂容你妄加评论！")
duanxiaonian:say("师姐，救世应当救民于水火，而非涂炭生灵。掌门此举，非但不是救世，简直是灭世！")
shaoyao:say("叛徒，休得再唤我师姐！仙竹门弟子听令，割下她的舌头和心脏，夺回圣物！")
dizi:say("是！")
hide_all_stage_bubble()
wait_twn(situ:movetoX(1100), qiliuge:movetoX(700), qiliuge:daze())
situ:say("且慢！")
shaoyao:say("仙竹门诛杀叛贼，闲人莫近，我们仙竹门的刀剑可不长眼睛。")
hide_all_stage_bubble()
local options = {
  "路见不平，拔刀相助！",
  "冷眼旁观。",
}
local idx = show_quick_selections(options)
if idx == 1 then
  set_flag("救段小年")
  situ:say("你仙竹门的事务，我虎焰门本不想插手，但在此地闹出人命，我等岂能坐视？")
  shaoyao:say("虎焰门也要来趟这趟浑水？刀剑无眼，你们可要考虑清楚。")
  hide_all_stage_bubble()
  local ret = start_preset_battle("罪恶之瓶之战")
  duanxiaonian:hide()
  if ret == 1 then
    shaoyao:say("各位都看到了，今日之事，非我芍药不用心，实在是这虎焰门横加干涉，破坏了我掌门的大计。")
    situ:say("既然不敌，便速速离去，何必在此饶舌。")
    shaoyao:say("哼！你不要太得意，待我南宫掌门亲自出手，定叫你好看！")
    qiliuge:say("虽然如此，但南宫燕掌门的手段，连侄儿都可能不留情面。")
    situ:say("这些事后自会处理，眼下战斗已了，不必多虑。")
    qiliuge:say("掌门，那被追的绿衣姑娘，不知何时不见了踪影。")
    situ:say("看来她是趁乱之中寻得了机会，悄然离去了。")
  else
    shaoyao:say("哼！不自量力的虎焰门！")
    dizi:say("师姐，不好了，她不见了！")
    shaoyao:say("可恶！赶紧找！不然掌门会要了我们的命！")
    situ:say("哎呀，那绿衣姑娘倒是机灵，这么快就溜之大吉了。")
  end
  
  if leave_menpai("段小年") then
    pop_tip("<color=#ff7a00>段小年</color>离开了仙竹门")
    play_sfx("Tip/Tip1.wav")
  end
else
  set_flag("不救段小年")
  situ:say("哦？你们的那些破铜烂铁，若真有半分眼力，也不敢在我(player:fullname)面前挥舞！")
  shaoyao:say("原来是(player:fname)掌门，我仙竹门此次是奉南宫掌门之命，前来惩处叛贼。如有叨扰，还望海涵。")
  situ:say("仙竹门的事情，我自然不便干涉。只是，我对你们口中的姑获鸟之瓶颇感兴趣，不知是何等宝物？")
  dizi:say("那姑获鸟之瓶可是我们南宫掌门……")
  shaoyao:say("多嘴！")
  shaoyao:say("南宫燕掌门，乃是(player:fname)掌门的姨母，她的吩咐，(player:fname)掌门自然不会坐视不理。")
  situ:say("是的！姨母之命，(player:gname)自当听从！仙竹门内部事务，虎焰门不该干涉！")
  shaoyao:say("(player:fname)掌门有礼了，我们这就将叛徒押回。")
  hide_all_stage_bubble()
  shaoyao:flip()
  shaoyao:movetoX(800)
  wait_twn(shaoyao:offsetY(-60), shaoyao:offsetY(60, 300))
  wait_twn(duanxiaonian:jumpTo(800, 130))
  shaoyao:movetoX(3000)
  wait_twn(duanxiaonian:movetoX(3000))
end

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成罪恶之瓶")
light_scene(0.25)
