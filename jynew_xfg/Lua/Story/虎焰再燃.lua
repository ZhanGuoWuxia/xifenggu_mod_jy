show_stage("火神树林.png", "火神树林")
set_bg_mat("ImgPaperFold")
play_bgm("Music/抉择_一念之间.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:bright()
situ:setPos(-300, 75)
situ:face_right()
qiliuge:setPos(-600, 75)
qiliuge:face_right()

situ:offsetX(800)
wait_twn(qiliuge:offsetX(800), qiliuge:daze())

situ:say("这火神树林，先前父亲之前经常带我来呢……")
qiliuge:say("这是自然呀，相传是火之神的居所，祖师爷得到了火之神庇佑，才创造出虎焰门的。")
situ:say("火之神的庇佑？")
qiliuge:say("掌门有所不知，虽说是“庇佑”，其实是一股力量，借由火焰而行的高深内力。")
situ:say("这也未免太玄了些，火神树林如何就能有这些？")
qiliuge:say("掌门殊不知，这日精月华，天人合一，本就是内功修习之道啊。")
situ:say("好，那咱们便也去寻寻这火神精华！")
hide_all_stage_bubble()

situ:offsetX(800)
wait_twn(qiliuge:offsetX(800), qiliuge:daze())

stage_narration("火神树木门口，有一棵巨大的树木。上面有凹陷的拳印，似乎有某种含义。")

qiliuge:say("火神树木近旁，便是这里了。")
situ:say("这里有一棵巨大的树木，上面还有凹陷的拳印，似乎有什么含义……")
hide_all_stage_bubble()

local options = {
    "先仔细观察一下，再做判断。",
    "或许这就是“疾风烈焰掌”的痕迹？",
    "巨木，掌印，“天人合一”……莫非是需要一些特殊手段？",
    "算了，我们还是回去吧。",
}
local idx = show_quick_selections(options)
switch(idx) {
    ["1"] = function()
        qiliuge:say("掌门，这拳印似乎是外力多次击打所致。")
        situ:say("有道理，或许是什么精巧机关，需要用外力开启？")
        qiliuge:say("拳脚我不行，掌门不妨试试看？")
        hide_all_stage_bubble()
        local options = {
            "攻击拳印位置",
            "算了，我们还是回去吧。",
        }
        local idx = show_quick_selections(options)
        switch(idx) {
            ["1"] = function()
                qiliuge:say("没什么反应啊，会不会力道不够？")
                situ:say("……")
                hide_all_stage_bubble()
                local options = {
                    "用力攻击拳印位置",
                    "算了，我们还是回去吧。",
                }
                local idx = show_quick_selections(options)
                switch(idx) {
                    ["1"] = function()
                        qiliuge:say("似乎有了些晃动，要不再试试？")
                        situ:say("我再试试。呼——还是没什么反应啊。")
                        hide_all_stage_bubble()
                        local options = {
                            "全力一击",
                            "算了，我们还是回去吧。",
                        }
                        local idx = show_quick_selections(options)
                        switch(idx) {
                            ["1"] = function()
                                qiliuge:say("……")
                                situ:say("……")
                                qiliuge:say("怎么一点反应都没有，不应该啊……要不——")
                                situ:say("六哥，它虽是死的，可我还是活的啊！我的反应是，咱们还是想想别的办法吧……")
                                qiliuge:say("可是掌门，这不少时辰了，与其在这里干耗着，不如回去仔细想想，过后再做打算？")
                                situ:say("也罢，我们回去吧。")
                            end,
                            ["2"] = function()
                                qiliuge:say("掌门，这么平白耗下去也是无用，不如先回去，有了头绪再来可好？")
                                situ:say("也罢，我们回去吧。")
                            end,
                        }
                    end,
                    ["2"] = function()
                        qiliuge:say("掌门，这么平白耗下去也是无用，不如先回去，有了头绪再来可好？")
                        situ:say("也罢，我们回去吧。")
                    end,
                }
            end,
            ["2"] = function()
                qiliuge:say("掌门，这么平白耗下去也是无用，不如先回去，有了头绪再来可好？")
                situ:say("也罢，我们回去吧。")
            end,
        }
        hide_all_stage_bubble()
    end,
    ["2"] = function()
        qiliuge:say("掌门，若是如此，我想我们也可以试着在这个痕迹上施加“疾风烈焰掌”的力道。")
        situ:say("的确。不过这法门我还并未完全参透，暂且试试，不知灵不灵。")
        hide_all_stage_bubble()
        local options = {
            "疾风烈焰掌",
            "算了，我们还是回去吧。",
        }
        local idx = show_quick_selections(options)
        switch(idx) {
            ["1"] = function()
                qiliuge:say("好像也没有什么反应……")
                situ:say("倒也在意料之内，或许是我力道不够纯熟，无法用内力催动机关。")
                qiliuge:say("那……")
                situ:say("只能另寻他法了……")
                qiliuge:say("可是掌门，这么平白耗下去也是无用，不如先回去，有了头绪再来可好？")
                situ:say("也罢，我们回去吧。")
            end,
            ["2"] = function()
                qiliuge:say("掌门，这么平白耗下去也是无用，不如先回去，有了头绪再来可好？")
                situ:say("也罢，我们回去吧。")
            end,
        }
        hide_all_stage_bubble()
    end,
    ["3"] = function()
        situ:say("……")
        qiliuge:say("掌门，总这么看着也不是个事儿啊……")
        situ:say("六哥，你看这掌印，似乎隐隐有血痕？")
        qiliuge:say("莫非——是血祭？")
        situ:say("血祭？难道是以人血催动机关的邪门术法？算了，试试看……")
        hide_all_stage_bubble()
        local options = {
            "割破手掌，滴入鲜血",
            "算了，我们还是回去吧。",
        }
        local idx = show_quick_selections(options)
        switch(idx) {
            ["1"] = function()
                stage_narration("(player:fullname)割破手掌，滴入鲜血。树上的符号突然亮了起来，树上出现了一道光门。")
                qiliuge:say("掌门！掌门你看！竟当真有机关！")
                situ:say("这奇术藏得倒深，也不知道是何方高人所布？")
                qiliuge:say("掌门，既然已经懂得其中关窍，不如等养精蓄锐之后，再一探究竟？")
                pop_tip("解锁副本：烈焰之迹")
                change_favor_by_id("司徒来也", 1)
                change_favor_by_id("齐六哥", 1)
                set_flag("完成虎焰再燃")
            end,
            ["2"] = function()
                qiliuge:say("掌门，这么平白耗下去也是无用，不如先回去，有了头绪再来可好？")
                situ:say("也罢，我们回去吧。")
            end,
        }
    end,
    ["4"] = function()
        qiliuge:say("掌门，这么平白耗下去也是无用，不如先回去，有了头绪再来可好？")
        situ:say("也罢，我们回去吧。")
    end,
}


black_scene(0.25)
hide_stage()
light_scene(0.25)
