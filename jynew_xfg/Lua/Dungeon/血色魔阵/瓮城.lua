avg_talk("", "瓮城，宛如一张张开的巨口，准备吞噬一切敢于挑战的来犯之敌，月光下更显得神秘莫测。")
if has_flag("完成瓮城") then
  return
end
local options = {
  "大步向前",
  "躲藏起来",
  "离开",
}
local idx = show_avg_select("", "月光洒满瓮城，四周寂静无声，却似乎暗藏杀机。", options)
switch(idx) {
  ["1"] = function()
      avg_talk("司徒来也", "这瓮城的寂静，比任何风暴都要来得凶猛，我们需步步为营。")
      avg_talk("朱鹮儿", "小(player:gname)，别这么紧张。这瓮城虽险，但有我朱鹮儿在，定能安然无恙。")
      avg_talk("万雀溪谷秘阵师", "哈哈，你们已步入了死亡的陷阱之中。")

      local ret = dungeon_battle("血色魔阵", "瓮城之战")
      if ret == 1 then
          avg_talk("司徒来也", "我们先登高望远，以观敌情。")
          set_flag("完成瓮城")
      else
          dungeon_fail("血色魔阵")
      end
  end,
  ["2"] = function()
      avg_talk("司徒来也", "我们隐匿身形，伺机而动。")
      avg_talk("", "你们藏身于阴影之中，突然一阵低沉的呼吸声打破了沉寂。")
      avg_talk("丁宣", "又是你们！今日便是你们的末日。")
      local ret = dungeon_battle("血色魔阵", "阴影之战")
      if ret == 1 then
          avg_talk("丁宣", "你们果然不凡，但今日我还有更重要的事，暂且放过你们。")
          avg_talk("司徒来也", "我们先登高望远，以观敌情。")
          set_flag("完成瓮城")
      else
          dungeon_fail("血色魔阵")
      end
  end,
  ["3"] = function()
      avg_talk("", "你选择了黯然离去，虽然心中有未竟之事，但江湖之大，何处不是舞台？")
      return
  end,
}
