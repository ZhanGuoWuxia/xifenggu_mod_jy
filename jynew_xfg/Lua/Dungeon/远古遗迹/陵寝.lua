avg_talk("", "站在一座古老的陵寝门前，门洞大开，从中散发出一股令人敬畏的力量。")
local options = {
  "进入",
  "离开",
}
local idx = show_avg_select("", "你的心跳加速，面对未知的诱惑和危险，你做出了选择", options)
switch(idx) {
    ["1"] = function()
      avg_talk("", "突然，黑暗中一个庞然大物袭面而来！")
      --战斗
      local ret = dungeon_battle("远古遗迹", "陵寝之战")
      if ret == 1 then
        avg_talk("司徒来也", "原来长生不老之宝是指这机关兽。")
        set_flag("完成远古遗迹")
        dungeon_success("远古遗迹")
      else
        avg_talk("司徒来也", "赶紧撤出去，快！")
        dungeon_fail("远古遗迹")
      end
    end,
    ["2"] = function()
      return
    end,
}
set_flag("完成陵寝")