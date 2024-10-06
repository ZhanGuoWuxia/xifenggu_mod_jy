show_stage("河边.png", "河边")
play_bgm("Music/密谋_夜郎.wav", 0.1)
light_scene(0.2)

local dongfangtun = actor("东方豚")
local hangong = actor("韩恭")
local situ = actor("司徒来也")

--初始化位置和朝向
bright_all_actors()
dongfangtun:setPos(1200, 75)
dongfangtun:face_left()
hangong:setPos(900, 75)
hangong:face_left()
situ:setPos(200, -500)
situ:face_right()

dongfangtun:say("又是虎焰门！简直欺人太甚！我要同你们这帮混蛋拼了！")
hangong:flip()
hangong:say("虎焰门人多势众，又是来势汹汹。东方公子人单力薄，何必行事如此冲动？")
dongfangtun:say("别拦我！旧仇新恨，我必得一并算清！")
hangong:say("江湖盛传东方公子贪恋女色，想不到当真如此。你对大小姐竟是痴迷至此……这般“真心”真是让我无话可说！")
dongfangtun:say("想我龙湾门曾经在江湖之中也有些地位，而今竟是要瞧着你们的脸色！若不是被虎焰门那帮混蛋——罢了罢了……不过你们也休要狗眼看人低！")
hangong:say("东方公子此言差矣，我韩恭岂是拜高踩低的小人？只是……")
dongfangtun:say("只是什么？")
hangong:say("罢了……说清了也免去一桩冤孽。当年我徒儿铁驴子被食为鲜那个姓宋的害了性命，却不想那仇人与令堂有些瓜葛！令堂为给那胼夫求情，亲来鹤岭门求见门主。偏就是那一夜，令堂便有了身孕。东方公子，你说这婚事……")
dongfangtun:say("休、休要信口雌黄！我、我同西门小姐……不，不可能！")
hangong:say("此事如何儿戏？")
dongfangtun:say("怎……怎么会是这样？可……")
hangong:say("虽说造化弄人，可这未必不是一件好事？")
dongfangtun:say("韩长老你怕是老糊涂了？这难道不是天大的笑话？")
hangong:say("非也！虽说公子与小姐无缘，可到底也是西门家之后。如今认祖归宗，接了鹤岭门去，还愁报不了龙湾门的血海深仇？")
dongfangtun:say("到底是韩长老稳妥！虎焰门……早晚必得是我东方豚的手下败将！")
hide_all_stage_bubble()

if not has_flag("抢人成功") then
    wait_twn(situ:jumpTo(600, 75), situ:daze())
    hangong:flip()
    situ:say("你们这些手下败将，又在密谋什么坏事？")
    hangong:say("上次让你小子侥幸而胜，这次你自己送上门来。")
    dongfangtun:say("(player:fullname)，新仇旧怨，今天一起算！")
    hide_all_stage_bubble()
    --战斗
    local ai = aiManager:getAI("AI/Menpai/鹤岭门")
    local startParam = {
      Team2 = {
        -- { Pos = 0, Role = ai:get_role_of_class("医师") },
        { Pos = 3, Role = get_role_by_id("韩恭") },
        { Pos = 5, Role = get_role_by_id("东方豚") },
      },
      MaxTurn = 99,
      BattleName = "击杀韩恭",
      IsQuick = false,
      PlayerTeam = 0,
      DisableJoinBattleCount = true,
      Scene = "BatteMaps/BattleScenes/HuYanMen_0.unity",
      BGM = "Music/热血_侠肝义胆.wav",
    }
    local ret = start_battle(startParam)
    if ret == 1 then
      hangong:say("公子快走，这里自有韩某挡着……")
      dongfangtun:say("韩长老，你的恩德来世再报……")
      hide_all_stage_bubble()
      dongfangtun:flip()
      wait_twn(dongfangtun:movetoX(3000))
      hangong:say("哈哈哈！吾愿已了！")
      hide_all_stage_bubble()
      hangong:rotatetoZ(-90)
      wait_twn(hangong:offsetY(-100))
      kill_disciple("韩恭")
      situ:say("……")
      set_flag("击杀韩恭")
    else
      situ:say("不惜一切代价撤离！")
      local player = get_player_role()
      player:ChangeHealthStatus(0)
      pop_tip("(player:fullname)重伤")
    end
end

black_scene(0.25)
hide_stage()

show_stage("华丽府内.png", "鹤岭门")
play_bgm("Music/回忆.wav", 0.1)
light_scene(0.2)

local ximenpo = actor("西门坡")
local dongfangtun = actor("东方豚")

--初始化位置和朝向
dark_all_actors()
ximenpo:setPos(800, 75)
ximenpo:face_right()
dongfangtun:setPos(2400, 75)
dongfangtun:face_left()

wait_twn(dongfangtun:movetoX(1200), dongfangtun:daze())

dongfangtun:setOverrideName("西门豚")
dongfangtun:say("孩儿东方——不，孩儿西门豚拜见父亲！")
ximenpo:say("你竟都知晓了？")
dongfangtun:say("先前不知，才做出那些蠢事，幸而如今也不算太迟。")
ximenpo:say("哈哈哈，拿得起放得下！当真是我西门家的人！")
dongfangtun:say("既是西门家的人，便更要为我西门家做打算，免得着了虎焰门那帮奸邪小人的道！")
ximenpo:say("哦？此言何意？")
dongfangtun:say("父亲有所不知，虎焰门那小子并非真心爱慕香妹，接近香妹，不过是想以此要挟，吞并鹤岭门罢了。可香妹竟当真上了他的当，被他的甜言蜜语所迷惑，对他死心塌地！")
ximenpo:say("岂有此理！竟算计到我西门坡头上来了！")
dongfangtun:say("既然我与父亲是同一血脉，定会倾尽全力帮助父亲铲除(player:fullname)，不会像霆弟那般中了小人的阴谋，一味偏帮，却全然不顾鹤岭门的安危！")
ximenpo:say("哈哈哈……果决狠厉，能成大事！为父有你帮衬左右，鹤岭门何愁不能如日方升！")

hide_all_stage_bubble()

if has_flag("完成灭亡食为鲜") then
  local areas = areas_of_menpai("龙湾门")
  for _, area in pairs(areas) do
    occupy_area("鹤岭门", area)
    wait_for_seconds(1.5)
  end
end

if join_menpai("东方豚", "鹤岭门") then
  pop_tip("<color=#ff7a00>东方豚</color>加入了鹤岭门")
  play_sfx("Tip/Tip1.wav")
end

black_scene(0.25)
hide_stage()
set_flag("完成东方豚上鹤岭")
light_scene(0.25)
