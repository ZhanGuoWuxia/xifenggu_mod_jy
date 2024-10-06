show_stage("虎焰山树林.png", "虎焰山树林")
set_bg_mat("ImgPaperFold")
play_bgm("Music/密谋_夜郎.wav")
light_scene(0.2)

local dongfangsha = actor("东方鲨")
local dongfangtun = actor("东方豚")
local situ = actor("司徒来也")
set_all_actors_mat("ImgPaperFold")

--初始化位置和朝向
bright_all_actors()
situ:setPos(-500, 75)
situ:face_right()
dongfangsha:setPos(1300, -500)
dongfangsha:face_left()
dongfangtun:setPos(1600, -500)
dongfangtun:face_left()

situ:movetoX(600)

--一起跳出来
wait_twn(dongfangsha:jumpTo(1000, 75), dongfangtun:jumpTo(1300, 75), dongfangtun:daze())

dongfangsha:say("哟，这不是虎焰门的少主吗？在这里遇到，真是巧啊。")
situ:say("东方鲨，你们龙湾门的人在此拦路，不知有何贵干？")
dongfangtun:say("哼，(player:fname)少主，别以为你是虎焰门的继承人就可以目中无人。我们龙湾门的名声和实力，可不是摆设。")
situ:say("直说吧，你们究竟有何企图？我并无闲情与你们纠缠。")
dongfangsha:say("哈哈，(player:fullname)别急着走。我们有个不情之请，只要你点头，我们便不会难为你。")
situ:say("什么要求？说来听听。")
dongfangtun:say("很简单，借我们一些金银。你们虎焰门财大气粗，这点小数目对你们来说不过是九牛一毛。")
situ:say("勒索？你们这是在挑衅虎焰门的底线？")
dongfangsha:say("哼，(player:fullname)别忘了，我们龙湾门与你们虎焰门是近邻。你们的财富，自然也有我们的一份。")
situ:say("你们这是在威胁我？")
dongfangtun:say("哎呀，(player:fullname)别误会。我们只是提供一种保护，让你免受江湖风波的侵扰。")
situ:say("我虎焰门自会保护自己，不需你们操心。")
dongfangsha:say("哈哈，小子，别和我们硬碰硬。想想清楚，虎焰门的名声可不能因为你而受损啊。")
hide_all_stage_bubble()
local money = math.floor(get_player_money() * 0.2)
local opt = string.i18_format("给钱（{0}）", money)
local options = {opt, "不给钱"}
local idx = show_quick_selections(options)
local function break_relation()
    set_both_friendship("player", "龙湾门", -100)
end
if idx == 1 then
    situ:say("好吧，我给你们钱。")
    if money <= 200 then
        dongfangsha:say("小子，才给这点钱？打发叫花子呢？")
        dongfangtun:say("(player:fullname)，你等着瞧吧。")
        break_relation()
    else
        dongfangsha:say("哈哈，小子，你还是明白事理的。")
        dongfangtun:say("哈哈哈，我们龙湾门可是不会亏待你的。")
        add_player_money(-money)
    end
elseif idx == 2 then
    situ:say("我才不会给你们钱。")
    dongfangsha:say("哼，小子，你可别后悔。")
    dongfangtun:say("(player:fullname)，你等着瞧吧。")
    break_relation()
end

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成勒索打劫")
light_scene(0.25)
