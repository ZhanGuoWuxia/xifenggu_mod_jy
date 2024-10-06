show_stage("bg_219.png", "虎焰门大堂")
light_scene(0.2)
play_bgm("Music/舒缓_云淡风轻.wav")

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")

--初始化位置和朝向
dark_all_actors()
situ:setPos(1100, 75)
situ:face_right()
qiliuge:setPos(700, 75)
qiliuge:face_right()

qiliuge:say("掌门，如今情势若想重振虎焰门，镇压宵小、扩大声望才是当务之急。")
situ:flip()
situ:say("六哥，请为我详细道来。")
qiliuge:say("掌门，在下倒觉得，武之道，不外乎“天时”、“地利”与“人谋”。")
qiliuge:say("前时酒香亭遭劫，那些流离失所之人亦是枕戈饮血。")
qiliuge:say("掌门不妨前往招募，想来定能遇到同仇敌忾的义士。")
situ:say("办法虽好，只是酒香亭大多隐逸之人，怎能忍心陷他们于险境？")
qiliuge:say("掌门心善，固然是好。只是酒香亭怕早已卷入险地而不自知了。")
hide_all_stage_bubble()
local options = {
    "什么意思？",
    "六哥似乎话中有话？",
}
local id = show_quick_selections(options)
switch(id) {
    ["1"] = function()
        qiliuge:say("在下也只是听说，此番豪猪长垄对酒香亭斩尽杀绝，与“火神之树”脱不了干系。")
    end,
    ["2"] = function()
        qiliuge:say("在下也只是私心揣测，这豪猪长垄对酒香亭斩尽杀绝，怕是与“火神之树”有关。")
    end
}
situ:say("我只听闻“火神之树”为酒香亭隐士所世代信奉？可他们从来与江湖无争啊。")
qiliuge:say("“夜鸦”现世，江湖动荡。只怕这豪猪长垄正是知道些什么，这才有此动作。")
situ:say("我知道了，放心，这酒香亭一带，我会细细留意的……")

black_scene(0.25)
hide_stage()
set_flag("完成解锁招募")
pop_tip("现在可以在<color=red>酒香亭</color>招贤纳士了，其他地块<color=red>发展度</color>达到一定值，也有奇人异士慕名前来。")
play_sfx("Tip/1宮.mp3")
restore_api.add_fire_point(5)
light_scene(0.25)
