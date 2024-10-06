
show_stage("龙万莹的房间.png", "龙万莹的房间")
play_bgm("Music/回忆.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local longwanying = actor("龙万莹")

--初始化位置和朝向
bright_all_actors()

situ:setPos(-400, 75)
situ:face_right()
longwanying:setPos(1100, 75)
longwanying:face_left()

wait_twn(situ:movetoX(800), situ:daze())


situ:say("听闻夫人每日以泪洗面，身体欠佳？")
longwanying:say("(player:fname)掌门有心了，夫君与儿子皆遭不幸，我是心情郁结所致。")
situ:say("此间因果，已然种下？夫人何不早日放下？")
longwanying:say("我若非身不由己，又岂会走到今日这步田地？")
situ:say("夫人若愿意，不妨来我虎焰门暂住些许时日，将这些年的故事娓娓道来，或许我能为夫人分担一二。")
longwanying:say("(player:fname)掌门若是有意，我愿慢慢说与你听。")
hide_all_stage_bubble()
local options = {
    "那我便洗耳恭听，夫人的故事定然曲折离奇",
    "你的故事，我或许能听出些门道",
}
local idx = show_quick_selections(options)
switch(idx) {
    ["1"] = function()
        situ:say("那我便洗耳恭听，夫人的故事定然曲折离奇。待我听完，或许能为夫人找到一线生机。")
        longwanying:say("若能如此，我自会将心中所藏，尽数告知。")
        situ:say("夫人请安心，虎焰门就是你的港湾。")
        longwanying:say("那便多谢(player:fname)掌门了，待我身体恢复，定当报答。")
    end,
    ["2"] = function()
        situ:say("你的故事，我或许能听出些门道。但此刻，我更关心的是夫人的安危。")
        longwanying:say("既然(player:fname)掌门愿意收留，我自然不会白白受恩。")
        situ:say("夫人若能自食其力，虎焰门自然不会亏待于你。")
        longwanying:say("(player:fname)掌门放心，我虽是女流之辈，却也有自己的本事。")
    end
}

player_add_disciple("龙万莹")
hide_all_stage_bubble()
black_scene(0.25)
hide_stage()
set_flag("完成遗落的夫人")
light_scene(0.25)
