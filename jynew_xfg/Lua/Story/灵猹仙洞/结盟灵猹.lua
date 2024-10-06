show_stage("bg_226.png", "灵猹仙洞")
play_bgm("Music/日常_烟火人间.wav", 0.1)
light_scene(0.2)

local situ = actor("司徒来也")
local xiada = actor("夏大")
local xiaer = actor("夏二")
local xiasan = actor("夏三")
local xiasi = actor("夏四")
local xiawu = actor("夏五")
local xialiu = actor("夏六")

--初始化位置和朝向
dark_all_actors()
situ:setPos(2200, 75)
situ:face_left()
xiada:setPos(1100, 75)
xiada:face_right()
xiaer:setPos(800, 75)
xiaer:face_right()
xiasan:setPos(-500, 75)
xiasan:face_right()
xiasi:setPos(-500, 75)
xiasi:face_right()
xiawu:setPos(-500, 75)
xiawu:face_right()
xialiu:setPos(-500, 75)
xialiu:face_right()

--先一起走过去
wait_twn(situ:movetoX(1400), situ:daze())
xiada:say("哈哈，(player:fname)掌门，你这远道而来，是有何贵干啊？")
situ:say("夏老大，我此行是为了结盟之事。我们两派若能联手，定能为武林带来新的气象。")
xiada:say("结盟？这正是我灵猹仙洞梦寐以求的。但是……")
situ:say("但是什么？")
xiada:say("不知道(player:fname)掌门是否带着诚意而来？")
situ:say("我当然满怀诚意，请求与贵派结盟交好。")
hide_all_stage_bubble()
local money = get_player_money()
local opt = string.i18_format("送上所有“诚意钱”（{0}）", money)
local options = {opt, "哪么说说怎么算“诚意”"}
local idx = show_quick_selections(options)
switch(idx) {
  ["1"] = function()
    situ:say("这是我虎焰门所有的钱财，今日双手奉上，只为交你们这个朋友！")
    if money <= 2000 then
      xiaer:say("怎么才这点钱？打发叫花子呢？")
      xiada:say("(player:fname)掌门请回吧。")
    else
      xiaer:say("(player:fname)掌门的心意，我们便收下了。")
      xiada:say("(player:fname)掌门言重了，我灵猹仙洞愿结交虎焰门，你我共享荣华富贵。")
      add_player_money(-money)
      local diplomatic = require("Common/diplomatic")
      set_both_friendship("player", "灵猹仙洞", 100)
      diplomatic.make_ally("player", "灵猹仙洞")
      set_flag("完成结盟灵猹")
    end
  end,
  ["2"] = function()
    xiaer:say("(player:fname)掌门，既然要结盟，总得证明你对我们的了解。")
    xiaer:say("我随意叫出其他四位兄弟，若(player:fname)掌门都识得，便真真切切把我们放在心上。")
    situ:say("夏二哥说的有理。")
    xiaer:flip()
    xiaer:say("出来吧——")
    hide_all_stage_bubble()
    local roles = { xiasan, xiasi, xiawu, xialiu }
    local idx = math.random(1, #roles)
    local role = roles[idx]
    wait_twn(role:movetoX(500), role:daze())
    xiaer:flip()
    xiaer:say("(player:fname)掌门，请问这位兄弟叫什么？")
    hide_all_stage_bubble()
    local opts = { "夏三", "夏四", "夏五", "夏六" }
    local i = show_quick_selections(opts)
    if i == idx then
      xiaer:say("(player:fname)掌门好眼力。")
      xiada:say("(player:fname)掌门果然有情有义，你这个朋友我们交定了。")
      role:flip()
      role:say("兄弟们，都出来吧。我们今天和虎焰们歃血为盟，大醉方休！")
      situ:say("哈哈哈——")
      local diplomatic = require("Common/diplomatic")
      set_both_friendship("player", "灵猹仙洞", 100)
      diplomatic.make_ally("player", "灵猹仙洞")
      set_flag("完成结盟灵猹")
    else
      xiaer:say("(player:fname)掌门，看来你并没有把我们放在心上。")
      xiada:say("(player:fname)掌门请回吧。")
    end
  end,
}

hide_all_stage_bubble()

black_scene(0.25)
hide_stage()
light_scene(0.25)
