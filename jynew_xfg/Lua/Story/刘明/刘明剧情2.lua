show_stage("厨房.png", "厨房")
play_bgm("Music/日常_烟火人间.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local liuming = actor("刘明")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
liuming:setPos(1300, 75)
situ:face_right()
liuming:face_left()

wait_twn(situ:movetoX(800), situ:daze())

situ:say("老刘，最近辛苦你了，又下厨房生火又要上战场御敌。")
liuming:say("掌门您言重了，俺的命本就是虎焰门的。")
hide_all_stage_bubble()
local options = {
    "老刘，你一定能成为息风谷最厉害的火工。",
    "有没有想过不当火工，当个真正的侠客？",
}
local idx = show_quick_selections(options)
switch(idx) {
    ["1"] = function()
        liuming:say("哎，可是，俺哪怕是真的成为了最厉害的火工，又能为虎焰门做点什么呢？")
        if has_flag("完成灭亡龙湾门") then
            situ:say("你可以把虎焰门厨房中的烈火燃得更加旺盛，成为息风谷最旺盛的烈火。")
            liuming:say("对！成为息风谷最旺盛的烈火！")
        else
            situ:say("你可以把虎焰门厨房中的烈火燃得更加旺盛，比起龙湾门的火焰，更要旺盛十倍，甚至二十倍。")
            liuming:say("对！比龙湾门旺他二十倍！")
        end
        situ:say("哈哈哈。")
        liuming:say("掌门，你这是在打趣俺吧，这厨房的火再旺，又有啥用？")
        situ:say("所以，你是否愿意担当更大的责任，为虎焰门做些别的事情？")
        liuming:say("别的？")
        situ:say("帮虎焰门重振雄风的刘大侠。")
    end,
    ["2"] = function()
        liuming:say("掌门您就别说笑了，俺除了生火啥也不会。")
        situ:say("老刘，你这话可就说错了。我那天仔细观察过你，你手下的火候掌控得恰到好处，这可不是一般人能做到的。这说明你其实很有武学天赋。")
        liuming:say("俺这胳膊粗壮，可是脑瓜子不好使，武学那可是要动脑筋的。")
        situ:say("武学之道，与生火之道，本质上是一样的，都是对火候的精准把控，对技艺的深刻理解。")
        situ:say("你能在火候上游刃有余，说明你的悟性极高，这正是习武之人所需。所以，老刘，你绝对是个习武的好材料。")
        liuming:say("掌门，您真的不是在诓俺？俺若是能习得武艺，那可是做梦也想不到的。")
    end,
}
liuming:say("俺把平时的烧火的心得都写在这本书里了，掌门您看看。")
situ:say("老刘，你这份用心实在难得。我感觉这更像是一本武功秘籍。")

hide_all_stage_bubble()
show_card{"火钳刀法"}
add_player_item("火钳刀法", 1)

change_favor_by_id("刘明", 1)

black_scene(0.25)
hide_stage()
set_flag("完成刘明剧情2")
light_scene(0.25)
