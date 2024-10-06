show_stage("bg_186.png", "鹿追的房间")
play_bgm("Music/少女鹿追.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local luzhui = actor("鹿追")

--初始化位置和朝向
dark_all_actors()
situ:bright()
situ:setPos(-400, 75)
situ:face_right()
luzhui:setPos(1200, 75)
luzhui:face_right()

if has_flag("完成鹿追剧情3") then
    wait_twn(situ:offsetX(800), situ:daze())
    situ:emotion("WeiSuo")
    situ:say("……")
    hide_all_stage_bubble()
    wait_twn(situ:offsetX(700, 2000))

    stage_narration("(player:fullname)突然从背后抱住了鹿追……")
    luzhui:shake()
    luzhui:say("呀……夫君……")
    if has_flag("完成鹿追剧情5") then
        situ:say("鹿儿的身体，好温暖呀~")
    else
        situ:say("小鹿的身体，好温暖呀~")
    end
    luzhui:say("嘻嘻，我可是，炙家族的传人。")
else
    wait_twn(situ:movetoX(900), situ:daze())
    situ:say("鹿追姑娘，在虎焰门的日子过得怎么样？")
    luzhui:say("夫君，你来了。自打离开了炙村，我便如离群之鸟，虽在虎焰门中日子无忧，但总觉少了些什么？")
    situ:say("鹿追姑娘，你不用这么客气，我身为掌门，自也应当照拂好你。这江湖险恶，但有我一日，便不会让你受到半分委屈。")
    luzhui:say("夫君……")
    situ:say("你只管放宽心，有啥需要，尽管跟我说。")
    luzhui:say("夫君，我便安心在此，早晚能融入这虎焰门中，我也想为虎焰门做些什么，为夫君分担一些。")
end


change_favor_by_id("鹿追", 1)
add_player_item("升龙丹", 1)

black_scene(0.25)
hide_stage()
light_scene(0.25)
