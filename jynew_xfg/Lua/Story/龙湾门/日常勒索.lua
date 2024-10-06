show_stage("禁地.png", "训练场")
set_bg_mat("ImgPaperFold")
play_bgm("Music/密谋_夜郎.wav")
light_scene(0.2)

local situ = actor("司徒来也")
local qiliuge = actor("齐六哥")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
dark_all_actors()
situ:setPos(700, 75)
situ:face_right()
qiliuge:setPos(2200, 75)
qiliuge:face_left()

wait_twn(qiliuge:offsetX(-900), qiliuge:daze())
qiliuge:say("掌门，不好了，龙湾门的人又来了，他们又要我们交保护费。")
situ:say("这些人真是得寸进尺，难道他们以为我们好欺负吗？")
qiliuge:say("他们态度强硬，好像如果我们不答应，他们就要对我们不客气了。")
situ:say("江湖路远，不是一天就能走到头的。这次，我来做个了断。")
hide_all_stage_bubble()
local money = math.floor(get_player_money() * 0.2)
local opt = string.i18_format("给钱（{0}）", money)
local options = {opt, "不给钱"}
local idx = show_quick_selections(options)
local function break_relation()
    set_both_friendship("player", "龙湾门", -100)
end
if idx == 1 then
    if money <= 200 then
        qiliuge:say("掌门，龙湾门的胃口很大，这点小钱满足不了他们。")
        situ:say("算了，打就打吧。")
        break_relation()
    else
        situ:say("好吧，我给他们一些钱。")
        add_player_money(-money)
    end
elseif idx == 2 then
    situ:say("不给钱，打就打吧。")
end

hide_all_stage_bubble()
black_scene(0.25)
hide_stage()
light_scene(0.25)
