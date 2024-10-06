avg_talk("", "这里有一个神秘宝箱。")
if has_flag("完成神秘宝箱") then
    return
end
avg_talk("司徒来也", "打开宝箱，也许会有意外的收获。")
add_player_item("精良剑", 1,"#(0-1)")
set_flag("完成神秘宝箱")