show_stage("虎焰山山洞.png", "虎焰山山洞")
set_bg_mat("ImgPaperFold")

play_bgm("Music/回忆.wav")

light_scene(0.2)

local situ = actor("司徒来也")
local zijinfeng = actor("子瑾风")
zijinfeng:setOverrideName("??")
zijinfeng:setScale(1.1)
local xuemolaozu = actor("血魔老祖")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(-500, 75)
situ:face_right()
zijinfeng:setPos(1100, 75)
zijinfeng:face_left()
xuemolaozu:setPos(2500, 75)
xuemolaozu:face_left()

wait_twn(situ:movetoX(800), situ:daze())
if has_flag("完成净心诫观") then
  zijinfeng:say("师弟，心魔既除，武道之途自然开阔。但切记，武学一途，非朝夕之功，唯有持之以恒，方能登峰造极。")
else
  zijinfeng:say("你便是(player:fullname)师弟？")
  situ:say("你就是老祖说的“师兄”？")
  zijinfeng:say("我听师父提起，你心性坚韧，毅力过人，是块练武的好材料。我叫<color=red>子瑾风</color>，你可以叫我瑾风师兄。")
end

zijinfeng:setOverrideName("子瑾风")

situ:say("过奖了，还得多多和师父、瑾风师兄请教。")
zijinfeng:say("来，师弟，你我师出同门，首次见面，不妨在这洞中以武会友，切磋一下？")
hide_all_stage_bubble()
local options = {
  "欣然应允",
  "婉言拒绝",
}
local idx = show_quick_selections(options)
if idx == 1 then
  situ:say("师兄剑法高超，我哪是你的对手。")
  zijinfeng:say("那我只用三成功力来领教你的武功。")
  situ:say("好，那就有请瑾风师兄多多指教了！")
  zijinfeng:say("师弟不必多礼，我也将全力以赴。")
  hide_all_stage_bubble()

  --战斗
  local startParam = {
      Team1 = {
          { Pos = 3, Role = get_role_by_id("司徒来也") },
      },
      Team2 = {
          { Pos = 3, Role = get_role_by_id("子瑾风_三成") },
      },
      MaxTurn = 99,
      BattleName = "剑心通明之战",
      IsQuick = false,
      PlayerTeam = 0,
      DisableJoinBattleCount = true,
      IsAskForPlayerFormation = false,
      Scene = "BatteMaps/BattleScenes/jyx2_3.unity",
      BGM = "Music/热血_侠肝义胆.wav",
      BattleTriggers = {"子瑾风开局", "子瑾风大招"}
  }
  local ret = start_battle(startParam)
  if ret == 1 then
    zijinfeng:say("师弟，看来我小瞧了你，接下来我用十成功力来战。")
    situ:say("瑾风师兄，不来了，我打不过你。")
    zijinfeng:say("看剑！师弟！")
    hide_all_stage_bubble()
    --战斗
    local param = {
      Team1 = {
          { Pos = 3, Role = get_role_by_id("司徒来也") },
      },
      Team2 = {
          { Pos = 3, Role = get_role_by_id("子瑾风") },
      },
      MaxTurn = 99,
      BattleName = "剑心通明之战二",
      IsQuick = false,
      PlayerTeam = 0,
      DisableJoinBattleCount = true,
      IsAskForPlayerFormation = false,
      Scene = "BatteMaps/BattleScenes/jyx2_3.unity",
      BGM = "Music/热血_侠肝义胆.wav",
      BattleTriggers = {"子瑾风开局", "子瑾风大招"}
    }
    local r = start_battle(param)
    if r == 1 then
      situ:say("瑾风师兄手下留情，师弟甘拜下风！")
      zijinfeng:say("你的武学境界已非我能及，我也无法再指导于你。")
      hide_all_stage_bubble()
      zijinfeng:flip()
      wait_twn(zijinfeng:movetoX(2500))
      stage_narration("山风呼啸，独留一人，(player:fullname)心感：高处不胜寒")
      add_player_item("武学札记", 2)
      goto story_end
    end
  end

    situ:say("瑾风师兄剑法高超，师弟心悦诚服！")
    zijinfeng:say("师弟，胜败乃武者常事，不必介怀。你已有小成，继续努力，他日必成大器。")
    hide_all_stage_bubble()
    play_bgm("Music/血魔老祖.wav")
    wait_twn(xuemolaozu:movetoX(1400), xuemolaozu:daze())
    zijinfeng:flip()
    xuemolaozu:say("瑾风，你的剑法又有精进，不愧是我血魔教中的佼佼者。")
    zijinfeng:say("师父过奖了，弟子还需多加修炼，方能达到师父您的境界之一二。")
    xuemolaozu:say("你们虽然有些武艺，但江湖险恶，实战之中，不可心慈手软，一击必杀，方能立于不败之地。")
    xuemolaozu:say("瑾风，你性格仁慈，但江湖不比寻常，不能总以仁义为先。你需学会狠辣，才能继承我的衣钵。")
    zijinfeng:say("师父教诲，弟子铭记在心。但弟子认为武学之道，心性最为重要，若心术不正……")
    xuemolaozu:say("(player:gname)，你觉得呢？")
    hide_all_stage_bubble()
    local options = {
      "同意师父",
      "同意师兄",
    }
    local idx = show_quick_selections(options)
    if idx == 1 then
      situ:say("师父所言极是，江湖之路，险象环生，唯有变通利己，方能行稳致远。")
      xuemolaozu:say("哈哈，孺子可教也。今日我便传你《血海魔功》，看看你的造化如何？")
      zijinfeng:say("师父，我先告辞了……")
      hide_all_stage_bubble()
      wait_twn(zijinfeng:movetoX(2500))
      situ:say("师父，师兄他……")
      xuemolaozu:say("不用管他，用心记住口诀：“血海茫茫，怒涛汹涌，心怀深仇，誓报此痛。魂系血海，意随浪涌，力透千钧，势不可挡。”")
      situ:say("师父，我记住了。")
      hide_all_stage_bubble()
      show_card{"血海魔功"}
      add_player_item("血海魔功", 1)
    else
      situ:say("瑾风师兄所言极是，武学之道，心性为本，功夫则为末。")
      xuemolaozu:say("你俩真是榆木脑袋——")
      hide_all_stage_bubble()
      wait_twn(xuemolaozu:flip(), xuemolaozu:jumpTo(1600, 600, 300, 3000), xuemolaozu:jumpTo(1800, 2000, 300, 3000))
      situ:say("师兄，师父他……")
      zijinfeng:flip()
      zijinfeng:say("师父就是这脾气。今日我与你分享我游历江湖所感悟的《浩然正气诀》。")
      situ:say("多谢师兄。")
      zijinfeng:say("师弟，用心记住口诀：“浩然正气，天地之始，心若明镜，映照天地。气定神闲，内力自生，如山岳峙，如江海行。”")
      situ:say("师兄，我记住了。")
      hide_all_stage_bubble()
      show_card{"浩然正气诀"}
      add_player_item("浩然正气诀", 1)
    end
else
  situ:say("瑾风师兄，我心中魔影方消，内力尚未完全平复。此刻切磋，恐怕难以发挥全力，不想因此影响了瑾风师兄的指导。")
  zijinfeng:say("师弟之心，我自明了。武学之路，犹如登山，急躁不得。待你心静如水，再行切磋不迟。")
end

::story_end::

hide_all_stage_bubble()
black_scene(0.25)
hide_stage()
set_flag("完成剑心通明")
light_scene(0.25)
