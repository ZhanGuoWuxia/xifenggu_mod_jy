avg_talk("", "城门两侧，是坚实的石墙，它们历经风雨，表面斑驳，却依旧坚如磐石。城门之上，一块风化的牌匾，依稀可辨“石头城”三字。")
if has_flag("完成城门") then
  return
end
local options = {
  "潜入",
  "离开",
}
local idx = show_avg_select("", "你站在城门前，心中涌动着一股莫名的决断。", options)
switch(idx) {
  ["1"] = function()
      avg_talk("司徒来也", "城门无人把守，正是我等潜入的良机。")
      avg_talk("朱鹮儿", "小(player:gname)，就算有守卫，也未必能拦得住我们。")
      avg_talk("万雀溪谷风水师", "警戒！警戒！有刺客潜入！")

      local ret = dungeon_battle("血色魔阵", "城门之战")
      if ret == 1 then
          avg_talk("司徒来也", "万雀溪谷的守卫果然警觉，我们需速战速决，继续前行。")
          set_flag("完成城门")
      else
          dungeon_fail("血色魔阵")
      end
  end,
  ["2"] = function()
      avg_talk("", "你选择转身离开，带着未竟的使命和心中的遗憾，踏上了归途。")
      return
  end,
}
