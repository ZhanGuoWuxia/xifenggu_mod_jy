
show_stage("华丽府内.png", "鹤岭门")
play_bgm("Music/西门香.wav")
light_scene(0.2)

local ximenxiang = actor("西门香")
local ximenpo = actor("西门坡")

--初始化位置和朝向
bright_all_actors()

ximenpo:setPos(800, 75)
ximenpo:face_right()
ximenxiang:setPos(1200, 75)
ximenxiang:face_left()

ximenxiang:say("爹，你居然自作主张毁掉我的婚约？")
ximenpo:say("虎焰门被夜鸦毁灭了，(player:fname)雷也遇害了，你嫁给(player:fullname)还有什么意义。")
ximenxiang:say("爹，你可是堂堂的鹤岭门掌门，与人约订的事情怎么说变就变，你在江湖上会留下什么样的名声。")
ximenpo:say("哼，通机变者为英杰，你现在要是嫁给(player:fullname)，我这买卖可是赔大了。")
ximenxiang:say("我的婚事，对你来说只是一场买卖吗？")
ximenpo:say("我这不是打比方吗，总之那场婚约是我和(player:fname)雷约订的，现在他不在了，我也不认了！")
ximenxiang:say("你从来没有尊重过我的想法。我和(player:fullname)是从小一起长大的，现在虎焰门有难，你居然直接置身事外。")
ximenpo:say("宝贝女儿，你这么漂亮，不愁嫁个尊贵的好人家呀。干嘛非得天天盯着虎焰门呢？")
ximenxiang:flip()
ximenxiang:say("哼！你太让我失望了！")
hide_all_stage_bubble()
wait_twn(ximenxiang:offsetX(200), ximenxiang:daze())
ximenpo:say("你去哪？")
ximenxiang:say("你别管我！")
hide_all_stage_bubble()
wait_twn(ximenxiang:movetoX(2500))
ximenpo:say("香儿！哎！你这不懂事的！")
hide_all_stage_bubble()
if leave_menpai("西门香") then
    pop_tip("<color=#ff7a00>西门香</color>离开了鹤岭门")
    play_sfx("Tip/Tip1.wav")
end


black_scene(0.25)
hide_stage()
set_flag("完成西门香出走")
light_scene(0.25)
