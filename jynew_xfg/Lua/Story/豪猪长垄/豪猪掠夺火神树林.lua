show_stage("火神树林.png", "火神树林")
light_scene(0.2)
play_bgm("Music/豪猪恶贼.wav")

local haozhu1 = actor("豪猪长垄弟子")
local haozhu2 = actor("豪猪长垄弟子二")
haozhu1:setOverrideName("豪猪长垄弟子")
haozhu2:setOverrideName("豪猪长垄弟子")
haozhu1:setPos(600, 75)
haozhu1:face_right()
haozhu2:setPos(1200, 75)
haozhu2:face_left()

local cnt = get_flag_int("豪猪破坏火神树林次数")
local isFinal = false
switch(cnt)
{
    ["0"] = function()
        haozhu2:hide()
        play_sfx("Story/Slash.mp3")
        wait_twn(haozhu1:offsetX(100), haozhu1:offsetX(-100), haozhu1:shake())
        haozhu1:say("他奶奶的，怎么就轮到我一个人在这鸟不拉屎的地方干苦力，而他们却能逍遥快活。")
        play_sfx("Story/Slash.mp3")
        wait_twn(haozhu1:shake(), haozhu1:shake(), haozhu1:shake(), haozhu1:shake())
        haozhu1:say("唉，这破差事真是累死人了，骨头都要散架了。")
        play_sfx("Story/Slash.mp3")
        wait_twn(haozhu1:shake(), haozhu1:shake(), haozhu1:shake(), haozhu1:shake())
        haozhu1:say("得了，差不多干完了，得赶紧把这一批木柴送到三当家那里去。")
    end,

    ["1"] = function()
        play_sfx("Story/Slash.mp3")
        wait_twn(haozhu2:shake(), haozhu2:shake(), haozhu2:shake())
        haozhu2:say("他娘的，这三当家怎么就对火神树林的木头这么上心，非得让我们这些兄弟累死累活地砍？")
        haozhu1:say("你这就不懂行情了，那火神树林的木头可都是宝贝，据说沾了上古火神的仙气，卖上个好价钱没问题。")
        play_sfx("Story/Slash.mp3")
        wait_twn(haozhu1:shake(), haozhu1:shake(), haozhu1:shake())
        haozhu2:say("这么说来，那虎焰门以前是靠着这片林子发了大财？")
        haozhu1:say("对头，据说他们跟林子里的神秘守护者有个什么狗屁约定，每年只能砍个一小部分。")
        haozhu2:say("哈哈哈，那些守护者八成是唬人的，咱们砍了这么多，也没见他们蹦出一个来。我看虎焰门就是找个借口，想独吞这块肥肉。")
        haozhu1:say("你说的不差。不过，得亏有那位英雄把虎焰门给收拾了，咱们才有机会捞一笔，哈哈哈。")
        haozhu2:say("哈哈哈，那我就多砍点，这次可得赚个盆满钵满！")
        hide_all_stage_bubble()
        play_sfx("Story/Slash.mp3")
        wait_twn(haozhu1:shake(40), haozhu2:shake(40), haozhu1:shake(40), haozhu2:shake(40))
    end,

    ["2"] = function()
        haozhu1:setOverrideName("黑猪堂堂主")
        haozhu2:setOverrideName("老八")
        play_sfx("Story/Slash.mp3")
        wait_twn(haozhu1:shake(40, 0.3), haozhu1:shake(40, 0.3), haozhu1:shake(40, 0.3))
        haozhu1:say("老八，这次咱们可得使出吃奶的力气，争取多砍些木材。上次二狗子他们抢了先，得了不少赏银，真是让人眼红。")
        haozhu2:say("堂主放宽心，我已经让兄弟们拿出了祖传的快斧，这次咱们绝不会再输给二狗子他们。")
        play_sfx("Story/Slash.mp3")
        wait_twn(haozhu1:shake(), haozhu1:shake(), haozhu1:shake())
        wait_twn(haozhu1:flip())
        haozhu1:say("哈哈，好！得了赏银后，咱们带黑猪堂的兄弟们去得月楼快活快活，那里的姑娘们可是出了名的柔情似水，哈哈……")
        haozhu2:say("嘿嘿，好的大哥……")
        wait_twn(haozhu2:movetoY(-600, 5000))
        haozhu1:flip()
        haozhu1:say("老八？")
        haozhu1:say("老八，你在哪里？别吓我……")

        wait_twn(haozhu1:flip(), haozhu1:flip(), haozhu1:flip())

        haozhu1:say("谁……谁在那里？？？")
        stage_narration("周围的气氛似乎突然变得异常热烈……")

        haozhu1:say("啊啊啊啊啊啊啊啊……")
        hide_all_stage_bubble()
        wait_twn(haozhu1:movetoY(-600, 5000))

        black_scene(1)
        hide_all_stage_bubble()
        light_scene(1)
        stage_narration("一个时辰后……")
        local liuming = actor("刘明")
        liuming:setPos(-400, 75)
        liuming:face_right()
        wait_twn(liuming:offsetX(900))
        liuming:say("唉，这些豪猪长垄的人，如此滥伐林木，终将受到惩罚的。")

        wait_twn(liuming:offsetX(100), liuming:offsetY(-50))
        liuming:say("火神大人，俺刘明今日多伐木三斤，实非本意，还望火神大人宽恕。")
        liuming:say("愿火神大人保佑三娘，保佑掌门早日完成虎焰门的复兴大业。")

        wait_twn(liuming:offsetY(50))
        liuming:say("嗯？这些斧头是谁遗忘在此的？")
        hide_all_stage_bubble()

        wait_twn(liuming:movetoX(1200), liuming:offsetY(-100), liuming:daze(1), liuming:offsetY(100))

        liuming:say("这是，豪猪长垄的令牌，嘿，既然现在门派急需兵器，这些豪猪帮的物资不要白不要。")
        hide_all_stage_bubble()

        wait_twn(liuming:movetoX(3000))

        add_player_item("普通剑", 1, "#(0-1)")
        add_player_item("普通刀", 1, "#(0-1)")
        add_player_item("普通枪", 1, "#(0-1)")
        add_player_item("普通弓", 1, "#(0-1)")
        isFinal = true
    end,
}

set_flag_int("豪猪破坏火神树林次数", cnt + 1)


if isFinal then
        --梁胜听取报告

    black_scene()
    hide_all_stage_bubble()
    hide_stage()
    play_bgm("Music/决心_仗剑天涯.wav")
    show_stage("bg_50.png", "窑洞")

    local liangsheng = actor("梁胜")
    local dizi = actor("豪猪长垄弟子")
    dark_all_actors()
    liangsheng:setPos(700, 75)
    liangsheng:face_right()
    dizi:setPos(2700, 75)
    dizi:face_left()
    light_scene()

    wait_twn(dizi:movetoX(1000))

    dizi:say("三当家，近日派去伐木的几位兄弟似乎未能按时回来。")
    liangsheng:say("有线索指向是何人干的吗？")
    dizi:say("有兄弟在外围打探，据说看到一个身材壮硕、力大无穷的樵夫。")
    dizi:say("单枪匹马就令黑猪堂的兄弟们全军覆没，连尸首都无影无踪，实在让人不寒而栗。")
    liangsheng:say("哼，看来我们碰上了一个硬茬。")
    liangsheng:say("先让其他伐木的兄弟们撤回到岗哨，等我收拾完虎焰门这帮小角色，再去会一会这位神秘的高手。")

    set_flag("豪猪停止破坏火神树林")

else
    local area = get_area_by_id("火神树林")
    if area then
        change_area_develop(area, -math.random(2,4))
    end
end

black_scene()
hide_stage()
light_scene()
