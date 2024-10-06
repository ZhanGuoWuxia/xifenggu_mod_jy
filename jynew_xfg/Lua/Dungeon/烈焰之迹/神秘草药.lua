avg_talk("", "这有一种散发着奇特香气的神秘草药。")
if has_flag("完成神秘草药") then
  return
end
avg_talk("司徒来也", "采到这种草药，也算是一种收获吧。")
add_player_item("麦子", 10)
set_flag("完成神秘草药")