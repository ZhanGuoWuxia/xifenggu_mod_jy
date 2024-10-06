show_stage("bg_226.png", "灵猹仙洞")
play_bgm("Music/日常_烟火人间.wav", 0.1)
light_scene(0.2)

local xiada = actor("夏大")
local xiaer = actor("夏二")
local xialiu = actor("夏六")

--初始化位置和朝向
bright_all_actors()

xiada:setPos(800, 75)
xiada:face_right()
xiaer:setPos(500, 75)
xiaer:face_right()
xialiu:setPos(1100, 75)
xialiu:face_left()

xiada:say("诸位兄弟，今日我们灵猹仙洞面临前所未有的危机。虎焰门的势力日渐壮大，我们若不采取行动，恐怕不久将无立足之地。")
xiada:say("夏六，你作为石马吊对决的胜者，前往虎焰门是最好的选择。")
xialiu:say("老大，你这是要我去虎焰门做卧底吗？我……我可不擅长这个。")
xiaer:say("夏六，你不必担心，以你的天真烂漫，定能在虎焰门混得风生水起。")
xiada:say("夏六，记住，江湖险恶，人心难测。在虎焰门，你要学会隐藏锋芒，以柔克刚。")
xialiu:say("老大，我明白了。我会小心行事，不辱使命。")
xiada:say("好，去吧。记住，无论何时，灵猹仙洞永远是你的家。")
xialiu:say("是，老大。无论走到哪里，我的心永远属于灵猹仙洞。")

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()

show_stage("bg_192.png", "虎焰堂")
play_bgm("Music/日常_烟火人间.wav", 0.1)
light_scene(0.2)

local xiada = actor("夏三")
local xialiu = actor("夏六")
local situ = actor("司徒来也")
local liuming = actor("刘明")
local zsniang = actor("朱三娘")

--初始化位置和朝向
bright_all_actors()

xiada:setPos(-500, 75)
xiada:face_right()
xialiu:setPos(-800, 75)
xialiu:face_right()
situ:setPos(1100, 75)
situ:face_left()
liuming:setPos(1400, 75)
liuming:face_left()
zsniang:setPos(1700, 75)
zsniang:face_left()

xiada:jumpTo(900, 75)
wait_twn(xialiu:jumpTo(600, 75), xialiu:daze())

xiada:say("(player:fname)掌门，我今日带着夏六前来，希望他能在虎焰门效力，以换取我们双方的和平。")
hide_all_stage_bubble()
local options = {
  "接受",
  "拒绝"
}
local idx = show_quick_selections(options)

switch(idx) {
  ["1"] = function()
    situ:say("夏老大，你真是个聪明人。虎焰门正需要像夏六这样的人才，我接受你的提议。")
    xialiu:say("哈哈，看来我在虎焰门也能大展拳脚。")
    xiada:flip()
    xiada:say("夏六，你在虎焰门要好好学习，好好练武。")
    xialiu:say("老大，你放心！")
    hide_all_stage_bubble()
    wait_twn(xiada:movetoX(-500))
    zsniang:say("夏六，你初来乍到，有什么不懂的可以问我。")
    liuming:say("夏六，你可别小看了虎焰门，这里可不比灵猹仙洞。")
    hide_all_stage_bubble()
    player_add_disciple("夏六")
    local diplomatic = require("Common/diplomatic")
    diplomatic.neutral("灵猹仙洞", "player")
  end,
  ["2"] = function()
    situ:say("夏六？他看起来并不像是个能担当大任的人。夏老大，你自己来我或许还会考虑。")
    xialiu:say("我……我就这么不受欢迎吗？")
    xiada:flip()
    xiada:say("哎！我们走吧。")
    hide_all_stage_bubble()
    xialiu:flip()
    xiada:movetoX(-500)
    wait_twn(xialiu:movetoX(-500))
  end,
}


hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
set_flag("完成英雄上门")
light_scene(0.25)
