show_stage("虎焰山山洞.png", "虎焰山山洞")
set_bg_mat("ImgPaperFold")
play_bgm("Music/血魔老祖.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local xuemolaozu = actor("血魔老祖")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(-400, 75)
situ:face_right()
xuemolaozu:setPos(1200, 75)
xuemolaozu:face_right()

wait_twn(situ:movetoX(800), situ:daze())
xuemolaozu:flip()
xuemolaozu:say("小娃娃徒儿，你可知道虎焰门灭门之祸是何人所为？")
hide_all_stage_bubble()
local options = {
    "告知夜鸦之谜",
    "暂且隐瞒线索"
}
local idx = show_quick_selections(options)
switch(idx) {
    ["1"] = function()
        situ:say("老祖师父，那夜虎焰门之变，痕迹斑斑，大堂门槛上有三道平行划痕，似非寻常兵刃所致。我等猜测，恐是夜鸦所为。")
        xuemolaozu:say("夜鸦？那乃是你父亲以前提到过的之神秘人物。他曾言，司南地宫与摇舟半岛，均有此痕迹出现，恐夜鸦已重现江湖。")
        situ:say("我爹爹如何说起？")
        xuemolaozu:say("你父曾忧心虎焰门首当其冲，特修书一封，邀我前来助阵。却不料……")
        situ:say("难道真乃夜鸦所谋？徒儿当如何寻得此人？")
        xuemolaozu:say("不用着急，此仇为师自会一探究竟。")
        xuemolaozu:say("那豪猪长垄在事后大举进犯，定与此事脱不了干系，你且紧追此线，必有发现。")
        situ:say("好！")
    end,
    ["2"] = function()
        situ:say("老祖师父，那夜虎焰门之变，痕迹斑斑，多少事物，付之一炬。我也没有什么发现？")
        xuemolaozu:say("不用着急，此仇为师自会一探究竟。")
        xuemolaozu:say("那豪猪长垄在事后大举进犯，定与此事脱不了干系，你且紧追此线，必有发现。")
        situ:say("好！")
    end
}
xuemolaozu:say("小娃娃徒儿，息风谷中有很多先辈留下的遗迹……比如“摄魂司”，它通过散布谣言、制造恐慌来影响敌人的士气和决策。")
situ:say("这么说，在息风谷中还有其他类似的遗迹吗？")
xuemolaozu:say("确实如此，这些遗迹隐藏着许多秘密和力量。你若能重建且善用它们，或许能为你的复仇之路增添几分胜算。")
situ:say("好的，师父。我记住了！")

hide_all_stage_bubble()
black_scene(0.25)
hide_stage()
set_flag("完成灭门之祸")
light_scene(0.25)
