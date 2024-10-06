
play_bgm("Music/豪猪恶贼.wav")

local area = get_area_by_id("虎苇地")
local isDesroyed = area == nil or area.Develop <= 0
if isDesroyed then
    show_stage("村庄废墟.png", "村庄废墟")
    local haozhu1 = actor("豪猪长垄弟子")
    local haozhu2 = actor("豪猪长垄弟子二")
    haozhu1:setOverrideName("豪猪土匪")
    haozhu2:setOverrideName("豪猪土匪")
    haozhu1:setPos(600, 75)
    haozhu2:setPos(1000, 75)
    haozhu1:face_right()
    haozhu2:face_right()
    haozhu1:say("这里怎么变成这样了？真是凄凉。")
    haozhu2:say("是啊，连个安生的地方都没有了。")
    black_scene()
    hide_all_stage_bubble()
    haozhu1:hide()
    haozhu2:hide()
    light_scene()

    local qiliuge = actor("齐六哥")
    local situ = actor("司徒来也")
    --初始化位置和朝向
    dark_all_actors()
    situ:bright()
    situ:setPos(-300, 75)
    situ:face_right()

    qiliuge:setPos(-600, 75)
    qiliuge:face_right()

    situ:offsetX(800)
    wait_twn(qiliuge:offsetX(800), situ:daze(), situ:offsetX(100))
    wait_twn(qiliuge:offsetX(100))
    qiliuge:say("这……")
    situ:say("这群山匪真是无法无天！")
    hide_all_stage_bubble()
    local options = {"收敛百姓尸身,收集有用的东西", "一言不发离去"}
    local idx = show_quick_selections(options)
    if idx == 1 then
        situ:say("六哥，让大伙儿帮忙收拾一下，我们要让乡亲们走得体面些。")
        qiliuge:say("明白，掌门。")
        situ:say("豪猪长垄，我们一定会让你们付出代价！")
        add_player_item("普通重甲", 2 ,"#(0-1)")
        add_player_item("普通轻甲", 2 ,"#(0-1)")
    elseif idx == 2 then
        wait_twn(situ:movetoX(3500))
        qiliuge:say("掌门……")
        add_player_item("龟岩气功", 1)
    end
    set_flag("豪猪停止破坏虎苇地")
else
    show_stage("虎苇地.png", "虎苇地某处村庄")
    local haozhu1 = actor("豪猪长垄弟子")
    local haozhu2 = actor("豪猪长垄弟子二")
    local lbx1 = actor("村民1")
    local lbx2 = actor("村民2")
    haozhu1:setOverrideName("豪猪山匪")
    haozhu2:setOverrideName("豪猪山匪")
    haozhu1:face_right()
    lbx1:face_right()
    haozhu2:face_left()
    lbx2:face_left()

    haozhu1:setPos(400, 75)
    lbx1:setPos(600, 75)
    lbx2:setPos(1000,75)
    haozhu2:setPos(1200, 75)
    light_scene(0.2)
    local idx = math.random(1,3)
    switch(idx){
        ["1"] = function()
            --姐弟
            lbx1:setOverrideName("痛苦的少年")
            lbx2:setOverrideName("痛苦的女子")
            lbx1:setRandomPic(false)
            lbx2:setRandomPic(true)
            local isGay = chance(50)
            if isGay then
                lbx2:say("你们这些山匪，别伤了我弟弟！")
                lbx1:say("姐，你快逃，别管我了！")
                lbx2:say("我不走，我们要在一起！你们快放开我们！")
                haozhu2:say("嘿嘿，别急嘛，咱们只是想和你们玩个“小游戏”，放松点。")
                wait_twn(haozhu1:shake(40), lbx1:shake(40))
                lbx1:say("啊————")
                lbx2:say("畜生!!!")
                haozhu1:say("哈哈哈，真他娘的刺激，这游戏好玩极了！")
            else
                lbx1:say("你们要对我姐姐做什么???")
                lbx2:say("别管我，快逃!!")
                lbx1:say("我不走，我们要在一起！你们快放开我们！")
                haozhu1:say("嘿嘿，别急嘛，咱们只是想和你们玩个“小游戏”，放松点。")
                lbx2:say("……（无声的哭泣）")
                wait_twn(haozhu2:shake(50), lbx2:shake(50))
                haozhu2:say("哈哈哈，有趣有趣，真是他娘的刺激。")
                lbx1:say("放开我姐姐!")
            end
        end,

        ["2"] = function()

            --夫妻
            lbx2:setOverrideName("被绑住的丈夫")
            lbx1:setOverrideName("死去的妻子")
            lbx2:setRandomPic(false)
            lbx1:setRandomPic(true)
            lbx1:setPos(600, -75)
            lbx2:setPos(1000. -105)

            haozhu1:say("他娘的，这么快就玩完了这局，真不够尽兴。")
            haozhu2:say("咱们还是赶紧撤吧，别在这儿磨蹭，免得招来不必要的麻烦。")
            lbx2:say("……（无法发声，只能以眼神传达绝望）")
            haozhu1:say("这俩人，咱们怎么处理？")
            haozhu2:say("这有何难？老子手痒痒，正好拿他们练练手艺……(轻描淡写地做了个切割的手势)")
            wait_twn(haozhu2:shake(50), lbx2:shake(40))
            wait_twn(lbx2:offsetX(-100, 50), lbx2:daze(), haozhu1:offsetX(400), haozhu1:flip(), lbx2:offsetX(-100, 50), lbx2:daze(), lbx2:offsetX(-100, 50), lbx2:flip())
            stage_narration("尽管受到束缚，丈夫仍缓缓地向他的伴侣挪动，最终在失去生机的她身旁静止。他的眼神中充满了无尽的哀伤，不久后也静静地离开了这个世界。")
            haozhu2:say("瞧他们，还挺情深意重的，咱们这不是成全了他们，让他们早点团聚嘛，真是狗咬吕洞宾，不识好人心。")
            haozhu1:flip()
            haozhu1:say("你他娘的心肠，真是让人猜不透。")
            haozhu2:say("彼此彼此，不过你那手段，可比老子狠多了。")
            haozhu1:say("哈哈，那是自然。")
        end,

        ["3"] = function()
            --父母
            local if_father = chance(50)
            lbx2:setOverrideName(if_father and "痛苦的父亲" or "痛苦的母亲")
            lbx1:setOverrideName("受辱的女儿")
            lbx2:setPic(if_father and "ai_old_male_1" or "ai_old_female_2")
            lbx1:setRandomPic(true)
            if if_father then
                lbx2:say("各位好汉，她只是个娃娃，求你们高抬贵手，别伤着她。")
                haozhu2:say("别他娘的急，老家伙，事儿总能有个了结。")
                wait_twn(haozhu2:shake(50), lbx2:shake(50))
                lbx2:say("啊————（痛苦的叫声）")
                wait_twn(lbx2:offsetY(-300))
                lbx1:say("阿爹!!!!")
                haozhu2:say("他娘的，这鬼哭狼嚎的，真是吵死人了。")
                lbx1:say("呜呜呜，阿爹……")
                haozhu1:say("别他娘的哭丧，这些都将成为过去。哈哈哈哈哈。")
            else
                lbx2:say("你们这群禽兽，我诅咒你们不得好死!!!")
                lbx1:say("放开我阿母!!")
                haozhu1:say("嘿嘿，你们就看着吧，咱们只是想玩个刺激的，别他娘的那么紧张。")
                haozhu2:say("对，这种所谓的骨肉亲情，在咱们眼里就是豆腐渣，一碰就碎。")
                haozhu1:say("哈哈哈，真他娘的过瘾，这种游戏好玩极了！")
            end
        end,
    }

    local area = get_area_by_id("虎苇地")
    if area then
        change_area_develop(area, math.random(-5, -2))
    end
end

black_scene()
hide_stage()
light_scene()
