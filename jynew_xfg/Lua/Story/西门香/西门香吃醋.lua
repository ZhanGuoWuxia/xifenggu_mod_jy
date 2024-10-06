
show_stage("西门香的房间.png", "西门香的房间")
light_scene(0.2)
play_bgm("Music/西门香.wav", 0.1)

local situ = actor("司徒来也")
local npc = actor("西门香")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-400, 75)
npc:setPos(1200, 75)
situ:face_right()
npc:face_left()

wait_twn(situ:movetoX(900), situ:daze())

npc:say("问你一个问题。")
situ:say("小时候，最怕你问问题了，因为我总是答不对。")
npc:say("这个问题你一定能答对。")
situ:say("那你问吧。")
npc:say("(player:fullname)，你如今…很喜欢鹿追姑娘吧？")
situ:say("这……")
hide_all_stage_bubble()
local options = {
    "是很喜欢啊。",
    "并没有很喜欢。",
}
local idx = show_quick_selections(options)
switch(idx) {
    ["1"] = function()
        if has_flag("完成鹿追剧情3") then
            if has_flag("完成鹿追剧情5") then
                situ:say("鹿儿她如同一束温暖的光芒，让人心里暖暖的。")
            else
                situ:say("小鹿她如同一束温暖的光芒，让人心里暖暖的。")
            end
        else
            situ:say("鹿追姑娘她如同一束温暖的光芒，让人心里暖暖的。")
        end
        npc:say("好吧！那确实可是一盏大大的光呢！")
        situ:say("(嗯，怎么感觉哪里好像不太对？)")

        npc:flip()
        npc:say("哼！")
        change_favor_by_id("西门香", -1)
    end,
    ["2"] = function()
        npc:say("你说谎！")
        if has_flag("完成鹿追剧情3") then
            if has_flag("完成鹿追剧情5") then
                situ:say("鹿儿确实很厉害，无论多艰难的时候，总能让人看到希望。")
            else
                situ:say("小鹿确实很厉害，无论多艰难的时候，总能让人看到希望。")
            end
        else
            situ:say("鹿追姑娘确实很厉害，无论多艰难的时候，总能让人看到希望。")
        end
        npc:say("那你还不是喜欢她。")
        situ:say("不是你理解的那种喜欢啊……")

        npc:flip()
        npc:say("讨厌！")
        change_favor_by_id("西门香", 1)
    end,
}

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成西门香吃醋")
light_scene(0.25)
