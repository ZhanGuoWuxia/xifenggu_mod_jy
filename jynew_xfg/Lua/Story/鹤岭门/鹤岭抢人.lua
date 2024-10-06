show_stage("bg_219.png", "虎焰门大堂")
set_bg_mat("ImgPaperFold")
light_scene(0.2)

local situ = actor("司徒来也")
local ximenxiang = actor("西门香")
local hangong = actor("韩恭")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
bright_all_actors()
situ:setPos(900, 75)
situ:face_right()
ximenxiang:setPos(-500, 75)
ximenxiang:face_right()
hangong:setPos(2500, 75)
hangong:face_left()

wait_twn(hangong:movetoX(1300), hangong:daze())

hangong:say("鹤岭门韩恭到此，欲与虎焰门掌门一叙。")
situ:say("鹤岭二老之一的韩长老，今日何故造访我虎焰门？")
hangong:say("(player:fname)掌门，明人不说暗话。我家大小姐，是否在贵门之中？")
situ:say("香儿？她的确在我门中。")
hangong:say("既然掌门不否认，那就请速将大小姐交出！若是坏了两派的和气，休怪韩某不客气了。")
situ:say("且慢，韩长老何必咄咄逼人！香儿的去留，她自会决断。")
hangong:say("呵，鹤岭门的事，还轮不到你们虎焰门来插手！")
situ:say("前辈不讲道理，晚辈恕难从命。")

hide_all_stage_bubble()
wait_twn(ximenxiang:movetoX(600), ximenxiang:daze())
situ:flip()
ximenxiang:say("(player:gname)……")
hangong:say("大小姐，还是请回吧……")
situ:flip()
ximenxiang:say("韩长老何必苦苦相逼？")
hangong:say("大小姐，你应该明白，这世上身不由己的事，可太多了。")
hide_all_stage_bubble()
local options = {
  "香儿不愿回鹤岭门，不能眼睁睁看着她被带走。",
  "韩恭武功高强，若是不放……"
}
local idx = show_quick_selections(options)
switch(idx) {
  ["1"] = function()
    situ:say("香儿，你对我有情，我决不能对你无意！")
    ximenxiang:say("韩长老武功高强，你现下不是他的敌手……")
    situ:say("大丈夫生于天地之间！岂能贪生怕死、首鼠两端，香儿若不愿，我死也不会让你回去！")
    hangong:say("那就让老夫来讨教讨教，你小子的功夫跟你的嘴哪个更硬！")
    hide_all_stage_bubble()
    --战斗
    local ai = aiManager:getAI("AI/Menpai/鹤岭门")
    local startParam = {
      Team2 = {
        -- { Pos = 0, Role = ai:get_role_of_class("医师") },
        { Pos = 3, Role = get_role_by_id("韩恭") },
        -- { Pos = 5, Role = ai:get_role_of_class("游侠") },
      },
      MaxTurn = 99,
      BattleName = "鹤岭抢人",
      IsQuick = false,
      PlayerTeam = 0,
      DisableJoinBattleCount = true,
      Scene = "BatteMaps/BattleScenes/HuYanMen_0.unity",
      BGM = "Music/热血_侠肝义胆.wav",
    }
    local ret = start_battle(startParam)
    if ret == 1 then
      situ:say("韩长老，看在香儿的份上，便到此为止吧！")
      hangong:say("哼！求亲不得便仗势欺人，虎焰门枉称江湖大派！")
      situ:say("一派胡言，是你们悔婚在先！如今又来强行夺人，还颠倒黑白！")
      situ:flip()
      ximenxiang:say("(player:gname)事已至此，我便也不再瞒你什么了。我原本生气被父亲当作货物一般交易，这才出走……可经过这些时日的相处，我对你……对虎焰门死心塌地……")
      situ:say("莫非此前相遇也是……")
      ximenxiang:say("相遇之时确有几分赌气，只是后来……我、我……希望你能明白我的心……")
      situ:say("香儿，既是知晓你的心意，我更不能辜负这份情意！")
      situ:flip()
      hangong:say("好好好！今次是我顾及两派体面，若虎焰门执意如此，来日自会来讨个公道！")
      hide_all_stage_bubble()
      hangong:flip()
      hangong:movetoX(3000)
    else
      ximenxiang:say("韩长老，你真要如此苦苦相逼吗……")
      hangong:say("你父亲为鹤岭门殚精竭虑，你却为儿女情长罔顾门派存亡！今日老夫一定要将你带回去！")
      situ:flip()
      situ:say("香儿不必担心，虎焰门上下还不至于如此软弱！")
      ximenxiang:say("可韩长老武功高强，我实在不忍心你……还有虎焰门上下因我一人有什么闪失……")
      situ:say("可恶……若是连香儿都保护不了……")
      ximenxiang:say("(player:gname)……我西门香既然决心加入虎焰门，便也该为虎焰门担当些才是！")
      situ:say("香儿……你……")
      hangong:say("哈哈，还是大小姐明理，无论如何，大小姐都是西门家的人，自然是要回去的。大小姐，请吧！")
      hide_all_stage_bubble()
      hangong:flip()
      hangong:movetoX(700)
      wait_twn(hangong:offsetY(-60), hangong:offsetY(60, 300))
      wait_twn(ximenxiang:jumpTo(700, 130))
      hangong:movetoX(3000)
      wait_twn(ximenxiang:movetoX(3000))
      situ:flip()
      situ:say("……")
      set_flag("抢人成功")
      if leave_menpai("西门香") then
        pop_tip("<color=#ff7a00>西门香</color>离开了虎焰门")
        play_sfx("Tip/Tip1.wav")
      end
    end
  end,
  ["2"] = function()
    ximenxiang:say("等等！韩长老，我跟您回去！")
    situ:flip()
    situ:say("香儿？")
    ximenxiang:say("此事非我所愿。但韩长老武功高强，我实在不忍心虎焰门与他为敌……")
    situ:say("我心中亦不愿香儿离去，但此事曲折颇多——罢了，暂且先回去，来日我定会亲去鹤岭门，给你一个交代。")
    ximenxiang:say("是我给虎焰门招致纠纷，我——")
    situ:say("何必自责？这些时日的情谊，绝不辜负。")
    ximenxiang:say("既然我自愿回去鹤岭门，还请韩长老不要为难虎焰门众人。")
    hangong:say("这个自然！大小姐，走吧！")
    hide_all_stage_bubble()
    hangong:flip()
    hangong:movetoX(700)
    wait_twn(hangong:offsetY(-60), hangong:offsetY(60, 300))
    wait_twn(ximenxiang:jumpTo(700, 130))
    hangong:movetoX(3000)
    ximenxiang:movetoX(3000)
    situ:flip()
    situ:say("……")
    set_flag("抢人成功")
    if leave_menpai("西门香") then
      pop_tip("<color=#ff7a00>西门香</color>离开了虎焰门")
      play_sfx("Tip/Tip1.wav")
    end
  end
}

black_scene(0.25)
hide_stage()
set_flag("完成鹤岭抢人")
light_scene(0.25)
