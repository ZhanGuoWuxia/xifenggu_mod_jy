show_stage("林中门派.png", "仙竹林")
play_bgm("Music/回忆.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local nangongyan = actor("南宫燕")

--初始化位置和朝向
dark_all_actors()
situ:setPos(800, 75)
situ:face_right()
nangongyan:setPos(1100, 75)
nangongyan:face_left()

situ:say("姨母，不知这竹林是什么地方？")
nangongyan:say("这么紧张做什么？难道担心姨母害你不成？")
situ:say("哪里哪里……")
nangongyan:say("这里是仙竹林，因这里僻静，最适合修行。")
nangongyan:say("只是莫乱走，周围遍布毒草奇花，这要是沾上什么毒，难保我能救你。尤其是这黑水仙，更是剧毒无比。")
situ:say("黑水仙？")
nangongyan:say("黑水仙是这里特有，奇毒无比，便是散发出的气味，便足以使一般人备受折磨了。")
situ:say("这样的猛毒，留在这里岂不是危险？")
nangongyan:say("你就有所不知了。南宫家代代擅于用毒，这黑水仙旁人碰都碰不得。")
nangongyan:say("可对南宫家来说，若用黑水仙辅助，修炼黑血魔骨这样的绝世武功。只是——")
situ:say("只是？")
nangongyan:say("这身体中的余毒也需丹药能够清除，不然纵使南宫家天赋异禀，终会反噬自身。")
nangongyan:say("若无炼药之法，也俢不成神功。而这也是南宫家的武学为何不怕他人觊觎的原因。")
situ:say("原来如此！若非姨母相告，侄儿我竟一无所知！")
nangongyan:say("说起来，你身体中也有南宫家的血脉，怎样，要不要也来用这黑水仙尝试一下？")
hide_all_stage_bubble()

local options = {
  "倒不如一试！兴许神功大成！",
  "黑水仙看起来剧毒无比，还是惜命重要……"
}
local idx = show_quick_selections(options)
switch(idx) {
    ["1"] = function()
        situ:say("那便试一下，也不知这黑水仙——咳咳……怎么喉咙奇痒无比，还腹痛难忍……")
        situ:emotion("BeiShang")
        situ:offsetY(-100)
        nangongyan:say("看着反应，想来你也不过如此了。")
        situ:say("姨、姨母，莫非……")
        nangongyan:say("看来你并没有继承到南宫家的血脉啊……罢了，这里有些解毒的丹药，你且服下，调理片刻便好。")
        situ:say("果、果然好多了……看来这绝世神功注定与我无缘了……")
        situ:emotion()
        situ:offsetY(100)
        nangongyan:say("哼，不过你也没有那么不中用，常人吃了这个不是哑了就是大病三个月。")
        situ:say("这黑水仙竟然毒性如此强烈！")
        nangongyan:say("既然没能驾驭黑水仙，短时间内也并未有快速提升功力之法。")
        nangongyan:say("但你也不算是废物，先将些浅显的法门传给你，再图以后。")
    end,
    ["2"] = function()
        situ:say("这种只有天选之人才能够驾驭的东西，光是触碰便感觉奇痒无比，晚辈不才，还是不尝试了……")
        nangongyan:flip()
        nangongyan:say("哼，不敢就是不敢，说什么花言巧语，真当我看不出是推脱的借口？")
        situ:say("哪里哪里，欲成大事者还是谨慎些好。侄儿也担心遇到什么不测，拖累了姨母不是？")
        nangongyan:flip()
        nangongyan:say("罢了……你这脾气秉性倒也像他，小心谨慎些也好……")
        situ:say("哪儿能人人都像姨母这般女中豪杰，将这毒物化为己用。")
        nangongyan:say("你倒是会说话……")
    end
}


hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成魔骨之梦")
light_scene(0.25)
