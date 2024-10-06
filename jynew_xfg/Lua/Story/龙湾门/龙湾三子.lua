show_stage("龙湾门大堂.png", "龙湾门大堂")
set_bg_mat("ImgPaperFold")
play_bgm("Music/密谋_夜郎.wav")
light_scene(0.2)

local dongfangzhouyu = actor("东方骤雨")
local longwanying = actor("龙万莹")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
dongfangzhouyu:setPos(700, 75)
dongfangzhouyu:face_right()
longwanying:setPos(1100, 75)
longwanying:face_left()

longwanying:say("夫君，今晚的月色甚是宜人……")
dongfangzhouyu:say("难得夫人如此兴致，可今晚为夫却要辜负夜色，不能陪夫人了。")
longwanying:say("瞎说，昨晚夫君还龙威虎势，如何今夜就偃旗息鼓了？")
dongfangzhouyu:say("夫人妩媚动人，为夫连战三日亦不在话下，只是现下不是分心之时。")
longwanying:say("夫君莫不是为了门中诸事？")
dongfangzhouyu:say("现下虎焰门被灭，江湖动荡，为夫不得不为将来打算啊。")
longwanying:say("哪有什么好愁的？有夫君在，妾身同三个孩子，还能被旁人欺负了去？")
dongfangzhouyu:say("哈哈哈哈，得妻如此，夫复何求？只是我闯荡半生，却也知道得未雨绸缪。")
longwanying:say("若如此，依妾身看来，立长立嫡。只是老大贪念口舌之欲，对下多有暴行。")
dongfangzhouyu:say("乖戾贪食是小，可不近人情未免会因小失大。")
longwanying:say("老二心思缜密，治下宽和，就是太过流连风月，未免儿女情长。")
dongfangzhouyu:say("英雄难过美人关，可知这温柔刀，才最致命啊。")
longwanying:say("夫君此言，妾身听着怎么倒像是意有所指呢？")
dongfangzhouyu:say("哈哈哈哈，夫人这刀，为夫甘之如饴。不然哪儿会有老三那小子？")
longwanying:say("夫君莫说笑，可说起老三这孩子，武学潜质是最高的，就是这性子太傲了。")
dongfangzhouyu:say("这倒颇有些为夫年轻时的样子！若非如此，怎能博得佳人以身相许？")
longwanying:say("看来夫君对门派将来之事已是胸有成竹，那还诓妾身说了这许多话！")
dongfangzhouyu:say("哈哈哈哈！夫人娇娃解语花，才有为夫鱼水欢。")
longwanying:say("夫君又怎知，妾身心念念庭前栽起合欢树，方好手掌里奇擎着解语花？")
dongfangzhouyu:say("哈哈哈！那便依了夫人之愿！")
hide_all_stage_bubble()
wait_twn(longwanying:flip(), longwanying:movetoX(3000))
stage_narration("月光满堂，东方骤雨心绪亦豁然开朗，却没留意龙万莹转入里间时，眼神中的复杂一瞬即逝。")

black_scene(0.25)
hide_stage()
set_flag("完成龙湾三子")
light_scene(0.25)
