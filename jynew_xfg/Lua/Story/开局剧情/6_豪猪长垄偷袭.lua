play_bgm("Music/山雨欲来风满楼.wav")
show_battle_route("豪猪寨", "酒香亭")
show_battle_route("豪猪寨", "虎苇地")
show_battle_route("豪猪寨", "火神树林")
avg_talk("齐六哥", "糟糕，怎么到处都是豪猪长垄的人！")
local is_veteran = is_ach_unlock("杀猪")
if is_veteran then
  avg_talk("司徒来也", "让我来……")
  local options = {
    "迎战",
    "退守",
  }
  local idx = show_quick_selections(options)
  if idx == 1 then
    --战斗
    local ai = aiManager:getAI("AI/Menpai/豪猪长垄")
    local startParam = {
      Team2 = {
        { Pos = 0, Role = ai:get_role_of_class("医师") },
        { Pos = 3, Role = get_role_by_id("梁胜") },
        { Pos = 5, Role = ai:get_role_of_class("游侠") },
      },
      MaxTurn = 99,
      BattleName = "豪猪长垄偷袭",
      IsQuick = false,
      PlayerTeam = 0,
      DisableJoinBattleCount = true,
      Scene = "BatteMaps/BattleScenes/HuYanMen_0.unity",
      BGM = "Music/热血_侠肝义胆.wav",
      BattleTriggers = {"梁胜开局", "梁胜大招"}
    }
    local ret = start_battle(startParam)
    if ret == 1 then
      avg_talk("司徒来也", "这些宵小竟敢趁乱偷袭。所有人，一鼓作气到虎焰堂抗敌！")
      set_flag("完成抵抗偷袭")
      tgr_achivement("抵抗偷袭")
      restore_api.add_fire_point(10)
      goto story_end
    end
  end
end
avg_talk("司徒来也", "看来他们是早有准备，我们必须小心应对！所有人，立刻退守到虎焰堂！")
occupy_area("豪猪长垄", "虎苇地")
occupy_area("豪猪长垄", "火神树林")
occupy_area("豪猪长垄", "酒香亭")
wait_for_seconds(2)
::story_end::
set_flag("完成豪猪长垄偷袭")
executefile("Story/开局剧情/7_潘麻子趁火打劫")