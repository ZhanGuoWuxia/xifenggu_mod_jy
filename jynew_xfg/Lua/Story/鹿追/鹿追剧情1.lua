show_stage("禁地.png", "训练场")
play_bgm("Music/少女鹿追.wav")

local luzhui = actor("鹿追")
local situ = actor("司徒来也")

--初始化位置和朝向
dark_all_actors()

situ:bright()
situ:setPos(-400, 75)
situ:face_right()
situ:emotion("WeiXiao")
luzhui:face_right()
luzhui:setPos(1200, 75)

wait_twn(situ:offsetX(600))

wait_twn(luzhui:jumpTo(1500, 200, 60, 2000))
--鹿追练武中
for i = 1, 3 do
    wait_twn(luzhui:moveTo(1300, 200, 4000), luzhui:offset(-300, 300, 4000), luzhui:offsetX(500, 4000), luzhui:offset(300, -300), luzhui:moveTo(1200, 75, 4000), luzhui:daze())
end
wait_twn(situ:offsetX(300))
situ:say("鹿追姑娘，你每日都如此精力充沛。")
luzhui:flip()
luzhui:say("你为何总是如此称呼我？你应该唤我娘子才是。")
situ:say("不，我觉得我们还是保持原来的称呼吧。毕竟我们相识尚浅，换称呼似乎有些不妥。")
luzhui:say("可是，我一心想要和你在一起，成为你的娘子。")
situ:emotion("HaiXiu")
situ:say("我明白你的心意，但我认为我们还需要更多的时间来了解彼此。")
luzhui:say("我明白，我会等你，直到你准备好接受我。")
situ:say("谢谢你理解，但我不能保证……")
luzhui:say("没关系，我会一直在这里等你，直到你准备好。")

change_favor_by_id("鹿追", 1)

black_scene(0.25)
hide_stage()
set_flag("完成鹿追剧情1")
light_scene(0.25)
