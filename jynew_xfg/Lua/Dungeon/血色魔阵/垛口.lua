avg_talk("", "沿着城墙的女墙，垛口排列得整整齐齐，宛如一道道小小的堡垒，守护着城墙的秘密。")
if has_flag("完成垛口") then
  return
end
local options = {
  "前进",
  "埋伏",
  "离开",
}
local idx = show_avg_select("", "你站在垛口中，心中涌动着万千思绪。", options)
switch(idx) {
  ["1"] = function()
      avg_talk("朱鹮儿", "我先行一步，探探前方的动静，你们随后跟上。")
      avg_talk("司徒来也", "鹮儿姑娘，莫急，我们一同前行，方能相互照应。")
      set_flag("完成城楼")
  end,
  ["2"] = function()
      avg_talk("司徒来也", "我们在此设伏，让他们尝尝我们的厉害。")
      avg_talk("", "你们隐匿在垛口之中，忽见一队守卫匆匆而来。")
      local ret = dungeon_battle("血色魔阵", "垛口之战")
      if ret == 1 then
        avg_talk("司徒来也", "这些守卫不过是小角色，解决了他们，我们继续前行。")
        set_flag("完成垛口")
      else
          dungeon_fail("血色魔阵")
      end
  end,
  ["3"] = function()
      avg_talk("", "你选择了黯然离去，心中却留下了一丝未了的情愫，也许江湖再见。")
      return
  end,
}