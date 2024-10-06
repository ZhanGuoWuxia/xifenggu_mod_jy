
show_stage("夜晚豪猪长垄.png", "豪猪长垄")
play_bgm("Music/回忆.wav")
light_scene(0.2)

local jing = actor("鲸")
local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")

--初始化位置和朝向
bright_all_actors()
jing:setOverrideName("强壮的黑衣人")
jing:setPos(2500, 75)
jing:face_left()
situ:setPos(-400, 75)
situ:face_right()
qiliuge:setPos(-700, 75)
qiliuge:face_right()

--先一起走过去
situ:movetoX(1100)
wait_twn(qiliuge:movetoX(800), qiliuge:daze())

situ:flip()
qiliuge:say("掌门，豪猪长垄中的那些混混都跑得差不多了。")
qiliuge:say("至于之前那些被抢来的姑娘，我也嘱咐刘明三娘他们都护送回家了。")
situ:say("辛苦六哥了，如此一来，也算是做了件好事——")
hide_all_stage_bubble()
play_bgm("Music/密谋_夜郎.wav")
wait_twn(jing:movetoX(1400, 2500), jing:daze())
situ:flip()
if has_flag("完成释放何猛") then
  jing:say("何猛……还真是一条丧家之犬啊……")
  situ:say("来者何人？")
  jing:say("哼！多嘴！")
else
  jing:say("虎焰门好大的胆子！")
  situ:say("来者何人？")
  jing:say("我的姓名，你还不配知道！")
end
wait_twn(qiliuge:offsetY(-100), qiliuge:daze())
qiliuge:say("好大的杀气，我内力都施展不出！")
jing:say("倒还不算眼瞎！劝你们乖乖受死，也好少受些折磨！")
situ:emotion("NaoHuo")
situ:say("哼！未免也太狂妄了些！单挑是吧，来呀！")
hide_all_stage_bubble()
--战斗
local startParam = {
  Team1 = {
      { Pos = 3, Role = get_role_by_id("司徒来也") },
  },
  Team2 = {
      { Pos = 3, Role = create_temp_role("鲸_残影") },
  },
  MaxTurn = 99,
  BattleName = "巨人残影之战",
  IsQuick = false,
  PlayerTeam = 0,
  DisableJoinBattleCount = true,
  IsAskForPlayerFormation = false,
  Scene = "BatteMaps/BattleScenes/jyx2_3.unity",
  BGM = "Music/最终boss.wav",
  BattleTriggers = {"鲸_残影开局", "鲸_残影大招"}
}
local ret = start_battle(startParam)
qiliuge:offsetY(50)
situ:emotion()
if ret == 1 then
  situ:say("多行不义必自毙，息风谷可容不下你这等恶徒！")
  jing:say("倒是有点本事，难怪何猛会死在你手上！只可惜，你们虎焰门惹了不该惹的人——")
  situ:say("你这话……什么意思？你到底是什么来历？！")
  jing:say("哼！这你还不配知道！这次你侥幸赢了，可未必一直能赢，豪猪长垄的这笔账早晚都得清算！")
else
  situ:emotion("BeiShang")
  wait_twn(situ:jumpTo(1000, 10), situ:daze())
  situ:say("该死……好阴狠的手段……")
  jing:say("不堪一击！也就那几个废物成事不足！")
  situ:say("你……难道是来替豪猪长垄出头的？")
  jing:say("那些窝囊废怎配我出手？只是有一点，你不该动了我的人！")
  situ:say("你的人？你到底是谁？究竟什么来历？！")
  jing:say("你还不配知道！")
end
hide_all_stage_bubble()
wait_twn(jing:flip(), jing:movetoX(2500, 2500))
shake_stage(20, 3)
situ:say("啊……")
qiliuge:say("掌门，你没事吧？")
situ:say("刚才那人…他的兵器……")
qiliuge:say("兵器？三叉戟？")
situ:say("大堂门槛…三道划痕……")
qiliuge:shake()
qiliuge:say("！！！")

black_scene(0.25)
hide_stage()
set_flag("完成巨人残影")
light_scene(0.25)
