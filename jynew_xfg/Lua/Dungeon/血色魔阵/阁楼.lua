avg_talk("", "阁楼，隐藏在屋顶的斜面之下，仿佛是房屋的秘密空间，充满了神秘与静谧。")
if has_flag("完成阁楼") then
  return
end
if has_flag("完成望楼") then
  avg_talk("司徒来也", "这里……似乎有剑匣，内藏之物散发一团青濛濛的光气。")
  avg_talk("朱鹮儿", "让我来打开，原来是一把玉剑，剑身流转着龙形纹路。")
  add_player_item("玉龙剑", 1)
  set_flag("完成阁楼")
elseif has_flag("完成护城河") then
  local options = {
    "爬上去（轻功>25）",
    "离开",
  }
  local idx = show_quick_selections(options)

  switch(idx) {
    ["1"] = function()
      local stat = role_attr("司徒来也", stat_key.qinggong)
      if stat > 25 then
        avg_talk("", "(player:fullname)轻舒猿臂，施展绝世轻功，如履平地般爬上阁楼，又伸手将同伴轻轻拉上。")
        avg_talk("司徒来也", "这阁楼之高，果然不同凡响。")
        avg_talk("司徒来也", "这里……似乎有剑匣，内藏之物散发一团青濛濛的光气。")
        avg_talk("朱鹮儿", "让我来打开，原来是一把玉剑，剑身流转着龙形纹路。")
        add_player_item("玉龙剑", 1)
        set_flag("完成阁楼")
      else
        avg_talk("", "(player:fullname))提气丹田，力图施展轻功，却因功力不足，爬至半途力竭而坠。")
        role_add_affix("司徒来也", "摔断腿")
        pop_tip(string.i18_format("(player:fullname)获得了{0}", affix_tip_link("摔断腿", "摔断腿", "#00DA2E")))
        avg_talk("司徒来也", "这一跌，恐怕今日之事难以为继了。")
      end
    end,
    ["2"] = function()
        avg_talk("", "你选择了黯然离去，心中虽有不舍，但知道时机尚未成熟，待他日再图大业。")
        return
    end
  }
end
