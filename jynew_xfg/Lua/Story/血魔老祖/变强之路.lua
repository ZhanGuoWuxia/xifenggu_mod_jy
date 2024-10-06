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
xuemolaozu:face_left()

wait_twn(situ:movetoX(800), situ:daze())
situ:say("血魔师父，弟子此来，请您指点一条变强之路。")
xuemolaozu:say("哈哈，变强之路？那不过是个虚名。我教你的，是如何在江湖中不择手段击败对手。")
xuemolaozu:say("武学之道，分为[外功]、[内功]、[轻功]三大类别。你需勤练不辍，懂得[运功]、[散功]之妙。")
situ:say("是。")
xuemolaozu:say("[技能策略]你需详细参谋，有助于找到敌人弱点，逐一击破。")
situ:say("弟子记住了。")
xuemolaozu:say("我传你的《血河大法》，乃是助你强身健体，虽是初级，但切勿小觑，待你练至纯熟，自会领略其中深意。")
xuemolaozu:say("在这个江湖，善恶不过是虚妄之言。唯有实力，才能决定一切。小娃娃徒儿你明白了吗？")
situ:say("弟子明白了。")
xuemolaozu:say("此外，不可专修[内功]，而忽视了[外功]。前日，为师用《搜魂大法》控制你施展的《血魔刀法》，刀出如风，狠辣异常，乃我教不传之秘。")
xuemolaozu:say("我教有门《破风刀法》，你若能练至炉火纯青，亦可为上乘武学。")
hide_all_stage_bubble()
show_card{"破风刀法"}
add_player_item("破风刀法", 1)
local options = {
    "师父，我教为何独钟刀法？",
    "师父，能教我除刀法以外的外功吗？",
}
local idx = show_quick_selections(options)
switch(idx) {
    ["1"] = function()
    end,
    ["2"] = function()
        xuemolaozu:say("乖徒儿，贪多嚼不烂，待你刀法练好，也能叱咤江湖。")
    end
}
xuemolaozu:say("刀，乃百兵之胆，上手最快，最能发挥血气之勇。我教众多江湖豪杰，便是凭此一刀，斩出了赫赫威名。")
xuemolaozu:say("但你师兄偏好剑法，独身前往飞星云顶，修习剑法，也是各有所志。")
situ:say("那弟子是否可以自行搭配外功招式？")
xuemolaozu:say("自然可以，我血魔教不拘一格，讲究的就是随心所欲，只要能变强，可以不用拘泥于任何形式。")
xuemolaozu:say("这些札记中记录了为师多年修习心得，你拿去好好研读，必有所得。")
situ:say("多谢血魔师父厚赐。")
hide_all_stage_bubble()
add_player_item("武学札记", 1)
local ops = {
    "师父，我教可有什么内功心法？",
}
local i = show_quick_selections(ops)
switch(i) {
    ["1"] = function()
        xuemolaozu:say("《血河大法》、《血海魔功》这些功法，虽能激增你的潜力，但若沉迷其中，过度修炼，只怕会反受其害，难以自控。")
        situ:say("弟子必定谨慎行事，不会让师父担忧。")
        xuemolaozu:say("《易筋经》乃是我教镇教之宝，传说源自少林，历经战火，流落江湖。是我教前任教主机缘巧合之下所得，经他整理注解，更添神妙。")
        xuemolaozu:say("此经书历来只有教主才能修习，代代相传，至今未曾外泄。")
        xuemolaozu:say("此后我也会传给继承我教衣钵之人。")
        situ:say("弟子定当勤学苦练，不负师父期望。")
        xuemolaozu:say("好，你有此志气，为师欣慰。")
    end,
}

hide_all_stage_bubble()
black_scene(0.25)
hide_stage()
set_flag("完成变强之路")
light_scene(0.25)