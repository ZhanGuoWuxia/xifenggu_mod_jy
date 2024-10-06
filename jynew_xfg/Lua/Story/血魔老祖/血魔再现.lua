show_stage("虎焰山山洞.png", "虎焰山山洞")
set_bg_mat("ImgPaperFold")
play_bgm("Music/血魔老祖.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local xuemolaozu = actor("血魔老祖")
local nvzi = actor("屈服的女子")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(-400, 75)
situ:face_right()
xuemolaozu:setOverrideName("？？？")
xuemolaozu:setPos(1200, 75)
xuemolaozu:face_right()
nvzi:setOverrideName("抽泣的女子")
nvzi:setPos(1500, 75)
nvzi:face_left()

nvzi:say("呜呜呜——")
hide_all_stage_bubble()
wait_twn(nvzi:flip(), nvzi:offsetX(2000))
xuemolaozu:say("呼——神清气爽！")

--走过去
wait_twn(situ:offsetX(1200), situ:daze())
hide_all_stage_bubble()
local options = {
    "老前辈，刚刚这是……",
    "怎么胆敢在我虎焰门领地轻薄妇女？为老不尊！",
}
local idx = show_quick_selections(options)

local function select_second()
    xuemolaozu:say("哈哈，你就是虎焰门的那个小娃娃？")
    situ:emotion("NaoHuo")
    situ:say("是又如何？你又是何来历！怎么做出如此不堪之事？报上名来！")
    situ:emotion()
    xuemolaozu:setOverrideName("血魔老祖")
    xuemolaozu:say("老夫江湖人称<color=red>血魔老祖</color>，还轮不到你个娃娃来指指点点！")
    situ:say("仗义执言可不分辈分！")
    xuemolaozu:say("娃娃口气不小，本事又如何？就让老夫用一成功力来试试你的火候！")
    hide_all_stage_bubble()
    --战斗
    local startParam = {
        Team1 = {
            { Pos = 3, Role = get_role_by_id("司徒来也") },
        },
        Team2 = {
            { Pos = 3, Role = create_temp_role("血魔老祖_一成") },
        },
        MaxTurn = 99,
        BattleName = "血魔再现",
        IsQuick = false,
        PlayerTeam = 0,
        DisableJoinBattleCount = true,
        IsAskForPlayerFormation = false,
        Scene = "BatteMaps/BattleScenes/jyx2_3.unity",
        BGM = "",
        BattleTriggers = {"血魔老祖开局"}
    }
    local ret = start_battle(startParam)

    play_bgm("Music/血魔老祖.wav")
    if ret == 1 then
        --应该不可能打过
        xuemolaozu:say("哈哈哈！小娃娃功夫不错。咱们以后有缘再见吧！")
        xuemolaozu:hide()
        situ:say("血魔老祖跑得倒快！这次侥幸，下次定不饶你！")
        tgr_achivement("击败血魔")
    else
        situ:emotion("BeiShang")
        wait_twn(situ:jumpTo(600, 10))
        xuemolaozu:say("哈哈哈！小娃娃有趣！有趣得很啊！")
        situ:say("（从未见过如此可怕的对手，而且这才一成功力。）")
        situ:say("呼……呼……你休要、休要嚣张……")
        xuemolaozu:say("别逞能了。老夫看你这本事，虽是个好苗子，但还得修炼些时候啊。")
        situ:say("呼……呼……再、再来！")
        situ:emotion()
        xuemolaozu:say("你若真有志气，练好武功再来也不迟！")
        xuemolaozu:hide()
        tgr_achivement("血魔青睐")
    end
    hide_all_stage_bubble()
    situ:emotion("JingYa")
    situ:say("这血魔老祖古怪，不知道是什么来历！")
    situ:say("咦，这是什么？好像是打斗时那血魔老祖留下的？")
    hide_all_stage_bubble()
    show_card{"血河大法"}
    add_player_item("血河大法", 1)
    add_player_item("高粱酒", 1)
end

switch(idx) {
    ["1"] = function()
        xuemolaozu:flip()
        xuemolaozu:say("哈哈哈！小娃娃，你说呢？")
        hide_all_stage_bubble()
        local ops = {
            "老前辈一定是见那姑娘抽筋了，帮她推宫过血。",
            "怎么胆敢在我虎焰门领地轻薄妇女？为老不尊！"
        }
        local i = show_quick_selections(ops)
        switch(i) {
            ["1"] = function()
                xuemolaozu:setOverrideName("血魔老祖")
                play_bgm("Music/血魔老祖.wav")
                xuemolaozu:say("小娃娃很会说话啊，我<color=red>血魔老祖</color>喜欢。")
                situ:emotion("WeiSuo")
                situ:say("拜见前辈，晚辈只想略尽地主之谊，老前辈不要见怪。")
                situ:emotion()
                xuemolaozu:say("看你这小娃娃嘴甜，老夫今天就送一点见面礼给你了。")
                situ:say("谢老前辈！")
                hide_all_stage_bubble()
                show_card{"血河大法"}
                add_player_item("血河大法", 1)
                add_player_item("高粱酒", 3)
                add_player_item("武学札记", 1)
                set_flag("恭维血魔")
            end,
            ["2"] = function ()
                select_second()
            end
        }
    end,
    ["2"] = function()
        xuemolaozu:flip()
        select_second()
    end
}

hide_all_stage_bubble()
black_scene(0.25)
hide_stage()
set_flag("完成血魔再现")
light_scene(0.25)
