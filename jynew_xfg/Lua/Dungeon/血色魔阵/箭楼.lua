avg_talk("", "箭楼矗立在城墙之上，宛如一位威武的将军，俯瞰着四周的疆域，沉默中透露着不可侵犯的威严。")
if has_flag("完成箭楼") then
  return
end
local options = {
  "挑战",
  "离开",
}
local idx = show_avg_select("", "你站在箭楼前，心中涌动着决断的勇气。", options)
switch(idx) {
  ["1"] = function()
      avg_talk("司徒来也", "最后一关，让我们一鼓作气，冲破这最后的障碍。")
      avg_talk("朱鹮儿", "小(player:gname)，想不到你还挺厉害的，我朱鹮儿也不甘落后。")
      avg_talk("万雀溪谷秘阵师", "万雀溪谷禁地，非请勿入，擅入者死！")

      local ret = dungeon_battle("血色魔阵", "箭楼之战")
      if ret == 1 then
          avg_talk("司徒来也", "看来，这箭楼也不过是纸老虎，我们轻松过关。")
          set_flag("完成箭楼")
      else
          dungeon_fail("血色魔阵")
      end
  end,
  ["2"] = function()
      avg_talk("", "你选择了黯然离去，心中虽然有些不甘，但江湖路远，总有再战之时。")
      return
  end,
}
