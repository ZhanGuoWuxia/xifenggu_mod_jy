
show_stage("虎苇地.png", "虎苇地")
light_scene(0.2)

local situ = actor("司徒来也")
local ximenxiang = actor("西门香")
local xiong = actor("[speaker:熊][img:anim_Xiong]")

--初始化位置和朝向
bright_all_actors()

situ:setPos(-400, 75)
situ:face_right()
ximenxiang:setPos(-700, 75)
ximenxiang:face_right()
xiong:setPos(2500, 75)
xiong:face_left()

wait_twn(situ:movetoX(700), situ:daze())

situ:say("这里的水真绿啊，抓几条鲫鱼回去，让三娘烧给大伙们尝尝。")
wait_twn(situ:jumpTo(800, -25), situ:daze())
situ:say("小鱼儿，来来来，六哥一条，三娘一条，还有老刘的……")
xiong:movetoX(1500)

play_bgm("Music/山雨欲来风满楼.wav", 0.1)
stage_narration("正当他全神贯注地抓着水里的鲫鱼时，前方不远处一头巨大的熊也在捕鱼。")
situ:say("这下不好，什么时候来了个这么大的庞然大物！")
xiong:jumpTo(1000, 75)
wait_twn(situ:shake(), situ:offsetX(-100))
situ:say("哎呀，这下可糟了。")
hide_all_stage_bubble()
--战斗
local startParam = {
    Team1 = {
        { Pos = 3, Role = get_role_by_id("司徒来也") },
    },
    Team2 = {
        { Pos = 3, Role = create_temp_role("巨熊") },
    },
    MaxTurn = 10,
    BattleName = "巨熊之战",
    IsQuick = false,
    PlayerTeam = 0,
    DisableJoinBattleCount = true,
    IsAskForPlayerFormation = false,
    Scene = "BatteMaps/BattleScenes/jyx2_2.unity",
    BGM = "Music/热血_侠肝义胆.wav",
    BattleTriggers = {"巨熊锁血"}
}
local ret = start_battle(startParam)
if ret == 1 then
--必输战斗
else
    wait_twn(situ:offsetY(-100), situ:daze())
    situ:say("（心中绝望地想）完了，完全动不了，我武功再高也无法施展，这下我得丧命于此啊！")
    situ:say("虎焰重燃的大计居然要结束在一头熊这里，开什么玩笑啊。")
    play_bgm("Music/西门香.wav", 0.1)
    wait_twn(ximenxiang:movetoX(1000, 1000), xiong:offsetX(300), ximenxiang:daze())
    ximenxiang:say("臭熊，赶紧走开！看剑！")
    hide_all_stage_bubble()
    --战斗
    local param = {
        Team1 = {
            { Pos = 3, Role = get_role_by_id("西门香") },
        },
        Team2 = {
            { Pos = 3, Role = create_temp_role("巨熊_一成") },
        },
        MaxTurn = 99,
        BattleName = "巨熊之战",
        IsQuick = false,
        PlayerTeam = 0,
        DisableJoinBattleCount = true,
        IsAskForPlayerFormation = false,
        Scene = "BatteMaps/BattleScenes/jyx2_2.unity",
        BGM = "Music/热血_侠肝义胆.wav",
        RolesAIMustControl = {"西门香"},
    }
    local r = start_battle(param)
    if r == 1 then
        play_bgm("Music/西门香.wav", 0.1)
        xiong:offsetY(-300)
        wait_twn(situ:offsetY(200), situ:daze())
        situ:say("啊，香儿……哦不，西门小姐，你怎么会在这里？")
        ximenxiang:flip()
        ximenxiang:say("你呀，刚才差点被这头畜生拍死，能不能不要自己一个人瞎溜达？让人好生担心。")
        situ:say("（怎么会有这种英雄被美人救的剧情啊……）")
        situ:say("西门小姐，实在感谢救命之恩！你怎么会在这里的？")

        ximenxiang:say("(player:fullname)，我跟我爹闹翻了，离家出走…… 没地方去，只好来找你了。")

        wait_twn(situ:movetoX(200))
        situ:flip()
        situ:say("啊，我何德何能！现在虎焰门也是处于危机之中，尚不能自保，你要不还是赶紧回去吧。")
        ximenxiang:say("哼，你果真如此绝情吗？啊……")
        hide_all_stage_bubble()
        
        ximenxiang:offsetY(-200)
        situ:flip()
        situ:say("香儿！香儿！你怎么了？")
        hide_all_stage_bubble()
        wait_twn(situ:movetoX(800))
    else
        --必赢战斗
    end
end

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成患难真情")
light_scene(0.25)

executefile("Story/西门香/安置西门香")
