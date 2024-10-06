avg_talk("", "吊桥，在风中轻轻摇曳，发出吱吱呀呀的声音，仿佛在诉说着岁月的故事，也似在低语着即将到来的危机。")
if has_flag("完成吊桥") then
  return
end
local options = {
  "踏上",
  "离开",
}
local idx = show_avg_select("", "吊桥在风中摇曳，你站在桥头，心中泛起层层波澜。", options)
switch(idx) {
  ["1"] = function()
      avg_talk("司徒来也", "吊桥上，每一步都可能是深渊，但我(player:fullname)行走江湖，何惧风浪？")
      avg_talk("蛇", "吱吱——")
      avg_talk("", "你小心翼翼地踩上去，突然，一条毒蛇从木板间窜出，令人措手不及。")
      avg_talk("朱鹮儿", "蛇？别怕，看我的。")
      local ret = dungeon_battle("血色魔阵", "吊桥之战")
      if ret == 1 then
          avg_talk("司徒来也", "好险！我们跳下河，继续向前。")
          set_flag("完成吊桥")
      else
          dungeon_fail("血色魔阵")
      end
  end,
  ["2"] = function()
      avg_talk("", "你决定不冒这个险，转身离开，心中却留下了一丝遗憾。")
      return
  end,
}
