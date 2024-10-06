
show_stage("bg_219.png", "虎焰堂")
play_bgm("Music/.mp3", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local zijinfeng = actor("子瑾风")

--初始化位置和朝向
bright_all_actors()

situ:setPos(500, 75)
situ:face_right()
zijinfeng:setPos(800, 75)
zijinfeng:face_left()

zijinfeng:say("唉……当真难办啊……")
situ:say("不知风兄所为何事，竟这般忧愁？")
zijinfeng:say("近日偶听一事，只是不知当讲不当讲。若说，便是对飞行云顶不忠，可不说，便是对贤弟不义……")
local options = {
  "既是对飞行云顶不忠之事，怎好强人所难？",
  "莫非是什么牵扯我虎焰门的要事？此事我绝不泄露，必不使风兄为难。"
}
local idx = show_quick_selections(options)
switch(idx) {
  ["1"] = function()
    zijinfeng:say("贤弟替为兄考虑，这份情意当真不易！此事非同小可，若为兄隐瞒只会更加于心不忍。")
  end,
  ["2"] = function()
    zijinfeng:say("既然这般，罢了！便说与你吧！毕竟此事对贤弟来说极为重要。")
  end,
}
situ:say("风兄请讲！")
zijinfeng:say("自虎焰门出事以来，为兄一直惦记查探各方消息。如今竟是查到导致虎焰门灭门的祸首，就是我飞星云顶的掌门！")
situ:say("这……阴阳王为何……")
zijinfeng:say("为兄亦是有此疑虑，这才细细调查其中因果。贤弟可知“夜鸦”之名？")
situ:say("果然……")
zijinfeng:say("贤弟可知道夜鸦在寻找一件绝世宝物，据说此物被你父亲藏于手中，而阴阳王与夜鸦一直与暗通款曲，这才给虎焰门招来了灭门之祸！")
situ:say("什么绝世宝物，我怎从未听父亲提起？便是有这东西，石冰又是如何得知？")
zijinfeng:say("据说此物有着扭转乾坤之力，这夜鸦一直苦心积虑，正是为了此物。为兄也只能打探到这些，至于旁得，恐怕也只有掌门清楚了。")
hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成灭门罪魁")
light_scene(0.25)
