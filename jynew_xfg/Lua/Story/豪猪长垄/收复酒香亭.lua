play_bgm("Music/决心_仗剑天涯.wav")

if not has_flag("百姓起义") then
    show_stage("bg_158.png", "虎焰山树林")
    set_bg_mat("ImgPaperFold")
    light_scene(0.2)

    local situ = actor("司徒来也")
    local qiliuge = actor("齐六哥")
    local nanzi = actor("[speaker:村民][img:pawn_CunMing_male_1]")
    set_all_actors_mat("ImgPaperFold")

    --初始化位置和朝向
    dark_all_actors()
    situ:setPos(1100, 75)
    situ:face_right()
    qiliuge:setPos(700, 75)
    qiliuge:face_right()
    nanzi:setPos(2400, 75)
    nanzi:face_left()

    wait_twn(nanzi:offsetX(-900), nanzi:daze())
    nanzi:say("(player:fname)掌门！豪猪长垄的人在此胡作非为，您终于来解救我们了，我们将跟随您一起战斗！")
    for i = 1, 2 do
        wait_twn(situ:flip(), situ:daze())
    end
    situ:say("好！诸位兄弟父老，随我一起去收复失地！")
    qiliuge:say("是！")
    nanzi:say("是！")
    situ:say("出发！")

    hide_all_stage_bubble()

    nanzi:flip()
    nanzi:offsetX(3000)
    situ:offsetX(3000)
    wait_twn(qiliuge:offsetX(3000))

    black_scene(0.25)
    set_flag("百姓起义")
    hide_stage()
end

if has_flag("完成变强之路") and has_flag("第一次收复") then  
    show_stage("酒香亭.png", "酒家")
    light_scene(0.2)
    
    local situ = actor("司徒来也")
    local qiliuge = actor("齐六哥")
    local nanzi = actor("[speaker:村民][img:pawn_CunMing_male_1]")
    local tangzhu = actor("豪猪堂主")
    local zijinfeng = actor("子瑾风")
    zijinfeng:setScale(1.1)
    
    --初始化位置和朝向
    dark_all_actors()
    situ:setPos(-300, 75)
    situ:face_right()
    qiliuge:setPos(-600, 75)
    qiliuge:face_right()
    nanzi:setPos(1300, 75)
    nanzi:face_right()
    tangzhu:setPos(1600, 75)
    tangzhu:face_left()
    zijinfeng:setPos(1200, 2000)
    zijinfeng:face_right()
    
    tangzhu:jumpTo(1500, 75)
    nanzi:say("啊——")
    wait_twn(nanzi:movetoY(-600, 5000))
    tangzhu:say("哈哈哈，就拿你们的血来喂我的刀。")
    
    situ:movetoX(900)
    wait_twn(qiliuge:movetoX(600), qiliuge:daze())
    
    situ:say("六哥，看来豪猪长垄已对起义百姓下手，今日便是我们为江湖正义而战的时候！")
    qiliuge:say("掌门所言极是，今日便是我们毕其功于一役之时！")
    tangzhu:say("哈哈哈，你们是来送死的吗？我等你们很久了！")
    hide_all_stage_bubble()
    play_bgm("Music/血魔老祖.wav")
    wait_twn(zijinfeng:flip(), zijinfeng:jumpTo(1000, 600, 300, 3000), zijinfeng:flip(), zijinfeng:jumpTo(1200, 75, 300, 3000), zijinfeng:daze())
    zijinfeng:say("师弟，让我子瑾风来助你一臂之力！")
    hide_all_stage_bubble()
    
    --战斗
    local ret = start_preset_battle("酒香亭收复战2")
    if ret == 1 then
        situ:emotion("NaoHuo")
        situ:say("老子今日便要让你们血债血偿，为枉死的冤魂讨回公道！")
        situ:jumpTo(1100, 75)
        zijinfeng:flip()
        wait_twn(zijinfeng:jumpTo(1300, 75), zijinfeng:daze())
        zijinfeng:say("师弟，你冷静点，你走火入魔了！")
        role_add_affix("司徒来也", "走火入魔")
        pop_tip(string.i18_format("(player:fullname)获得了{0}", affix_tip_link("走火入魔", "走火入魔", "#BA00FF")))
        hide_all_stage_bubble()
        tangzhu:flip()
        tangzhu:movetoX(3000)
        qiliuge:say("大侠，现在该怎么办？")
        zijinfeng:say("去找我师父，我们合力为他导气调顺。")
        occupy_area("虎焰门", "酒香亭")
        set_flag("完成收复酒香亭")
        set_flag("走火入魔")
    else
        situ:say("不好……先撤退吧，免得大家受伤！")
        qiliuge:say("是！")
        hide_all_stage_bubble()
       
        --离开
        situ:flip()
        situ:movetoX(-500)
        qiliuge:flip()
        qiliuge:movetoX(-500)
        zijinfeng:flip()
        wait_twn(zijinfeng:movetoX(-500))
    end
    
    hide_all_stage_bubble()
    
    black_scene(0.25)
    hide_stage()
    light_scene(0.25)
    return
end

show_stage("酒香亭.png", "酒家")
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
local tangzhu = actor("豪猪堂主")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(-300, 75)
situ:face_right()
qiliuge:setPos(-600, 75)
qiliuge:face_right()
tangzhu:setPos(1500, 75)
tangzhu:face_left()

situ:offsetX(1300)
wait_twn(qiliuge:offsetX(1300), qiliuge:daze())

situ:say("六哥，我们终于回来了。")
tangzhu:say("虎焰门的丧家之犬，还敢回来？")
situ:say("酒香亭是我们虎焰门的地盘，你们这群豪猪崽子，还不快快滚出去！")

hide_all_stage_bubble()

--战斗
local ret = start_preset_battle("酒香亭收复战")
if ret == 1 then
    tangzhu:say("想不到你还有两下子，我先走了！")
    hide_all_stage_bubble()
    tangzhu:flip()
    tangzhu:movetoX(3000)
    wait_twn(situ:offsetX(500), situ:daze())
    occupy_area("虎焰门", "酒香亭")
    situ:say("酒香亭，终于收复了！")
    set_flag("完成收复酒香亭")
    set_flag("第一次收复")
else
    situ:say("不好……先撤退吧，免得大家受伤！")
    qiliuge:say("是！")
    hide_all_stage_bubble()
   
    --离开
    situ:flip()
    situ:movetoX(-500)
    qiliuge:flip()
    wait_twn(qiliuge:movetoX(-500))
end

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
light_scene(0.25)
