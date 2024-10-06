avg_talk("", "闸楼，矗立在水道之畔，由厚重的石块砌成，石面上刻满了岁月的痕迹和水流的侵蚀，它见证了无数的风雨和沧桑。")
if has_flag("完成闸楼") then
  return
end
local options = {
  "硬闯",
  "离开",
}
local idx = show_avg_select("", "闸楼紧闭，你站在门前，心中充满了决断。", options)
switch(idx) {
  ["1"] = function()
      avg_talk("司徒来也", "看来我们只能凭实力度过这关。")
      avg_talk("朱鹮儿", "小(player:gname)，我们哪次不是凭实力闯荡过来的。")
      avg_talk("万雀溪谷温泉师", "你们这些小贼，竟然如此嚣张。")

      local ret = dungeon_battle("血色魔阵", "闸楼之战")
      if ret == 1 then
          avg_talk("司徒来也", "冲啊，我体内的力量如同洪流般澎湃。")
          avg_talk("朱鹮儿", "小(player:gname)，你还是那么热血……")
          set_flag("完成闸楼")
      else
          dungeon_fail("血色魔阵")
      end
  end,
  ["2"] = function()
      return
  end,
}
