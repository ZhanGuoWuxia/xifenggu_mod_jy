show_stage("虎苇地.png", "虎焰山脚")
set_bg_mat("ImgPaperFold")
play_bgm("Music/ThunderRain.mp3")
local filter = add_camera_filter("CameraFilterPack_Atmosphere_Rain_Pro")
filter.Fade = 0.6
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(1100, 75)
situ:face_right()
qiliuge:setPos(700, 75)
qiliuge:face_right()

stage_narration("虎焰山脚树林子里，四十六块墓碑，有些是青石的，有些是红木的。")
qiliuge:say("大少爷，掌门与夫人之死，相当有蹊跷。")
situ:flip()
situ:emotion("NaoHuo")
situ:say("嗯……")
situ:emotion()
hide_all_stage_bubble()
local options = {
    "爹娘离世如此突然，确有相当的疑点。",
    "蹊跷？此话怎讲？",
}
local idx = show_quick_selections(options)
switch(idx) {
    ["1"] = function()
        qiliuge:say("大少爷，你冷静下来，仔细回想当日情景。")
    end,
    ["2"] = function()
        qiliuge:say("大少爷不妨冷静下来细想想当日情况。")
    end
}
qiliuge:say("掌门与夫人惨遭杀害，但大少爷不觉得，这伤口有些不寻常？夫人不懂武功，为何看起来像是在为掌门挡刀？")
situ:say("确实有些古怪，但父亲身上大小伤痕多处，难道不是为了保护母亲？")
qiliuge:say("夫人是一刀致命，更像是为了掌门挡刀而死。而掌门虽然伤痕遍布，致命伤却只有一处贯胸的伤口……")
situ:emotion("BeiShang")
situ:say("你的意思是？")
situ:emotion()
qiliuge:say("如果推断无误，凶手先是控制了夫人，以此要挟掌门。似乎想问出些什么，掌门因此遭受了无尽的折磨。最后凶手一无所获，愤怒之下，才下了杀手。")
situ:emotion("KuQi")
situ:say("这么说……凶手的目标从一开始就是我爹娘？")
situ:emotion()
qiliuge:say("恐怕确实如此。")
hide_all_stage_bubble()
local ops = {
    "从未听闻爹娘有仇家。",
    "为何又会牵连虎焰门？",
    "恐怕其中另有隐情……"
}
local id = show_quick_selections(ops)
switch(id) {
    ["1"] = function()
        situ:say("爹向来行事光明磊落，母亲更是不曾与江湖中人结怨。究竟是何人下此毒手？")
    end,
    ["2"] = function()
        situ:emotion("NaoHuo")
        situ:say("即便是爹娘的仇家，又为何要对虎焰门下此狠手？这手段未免太过残忍！")
        situ:emotion()
    end,
    ["3"] = function()
        situ:say("爹娘常说“江湖险恶”，我实在想不出有何仇家，也自信虎焰门行事端正。这真凶不仅严刑逼供，更是屠尽虎焰门上下。莫非是有所图谋……")
    end
}
qiliuge:say("大少爷可还记得，朱三娘曾说大堂门槛上有三道诡异的划痕。")
situ:say("是了，这划痕是隐藏着什么线索吗？")
qiliuge:say("那痕迹看似巨型鸟兽之爪痕。相传司南地宫灭门时也出现过此痕迹，只怕是那……夜鸦又现世了……")
situ:emotion("NaoHuo")
situ:say("夜鸦？")
situ:emotion()
qiliuge:say("传说当年羿射九婴，部分陨落在息风谷一带，被山中乌鸦啄食，乌鸦化神兽名曰“屈居”。相传夜鸦嗜杀，能口吐烈焰，寻常难遇，遇者皆被焚而亡。")
situ:emotion("YaoYa")
situ:say("我可不信这种无端的传说。")
situ:emotion()
qiliuge:say("大少爷有所不知，之前司南地宫和摇舟半岛被灭门，相传也是夜鸦之祸。那三道划痕便是灭门的印记。")
situ:say("话虽如此，但鬼神之说如何能信？")
qiliuge:say("若此事乃是掌门亲口所言呢？")
situ:emotion("JingYa")
situ:say("什么！")
situ:emotion()
qiliuge:say("当日两派灭门，江湖大乱，豪猪长垄便想借此吞并虎焰门。掌门当着众人说出“夜鸦”二字，便吓退了那些乌合之众。")
situ:say("怎会如此？！")
qiliuge:say("此可见，此事必有内情。不是表面的豪猪长垄攻过来这么简单……")
hide_all_stage_bubble()

situ:emotion("YaoYa")
wait_twn(situ:flip(), situ:daze(0.3), situ:offsetX(200), situ:daze(0.3))
stage_narration("如果不是豪猪长垄有计划的来犯，那仇人究竟是谁？")
stage_narration("(player:fullname)思绪千万，远远伫立。")

black_scene(0.25)
remove_camera_filter("CameraFilterPack_Atmosphere_Rain_Pro")
hide_stage()
set_flag("完成埋葬悲伤")
tgr_achivement("开局灭门")
light_scene(0.25)
executefile("Guide/地图沙盘_引导")
