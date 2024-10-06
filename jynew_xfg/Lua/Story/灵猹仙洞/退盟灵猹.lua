avg_talk("司徒来也", "夏大，夏二，思虑再三，我们还是各自为政最好。")
avg_talk("夏大", "(player:fname)掌门，不知我们兄弟六人有哪里得罪了你？")
avg_talk("夏二", "(player:fname)掌门，为了留住我们的友谊，我们愿意献上宝物。")
local options = {"接受", "拒绝"}
local idx = show_quick_selections(options)
if idx == 1 then
  avg_talk("司徒来也", "都有什么宝物，拿来看看吧！")
  local item_options = {"臭屁箭法", "猹影枪法", "血饮刀法", "爱耍剑法"}
  local item_idx = show_item_card_select(item_options)
  local item_id = item_options[item_idx]
  add_player_item(item_id, 1)
  avg_talk("司徒来也", "既然你们这么有情义，那我们还是同盟。")
  avg_talk("夏大", "我们兄弟们永远愿为你驱策。")
else
  local diplomatic = require("Common/diplomatic")
  diplomatic.neutral("player", "灵猹仙洞")
end
set_flag("完成退盟灵猹")
