avg_talk("", "护城河，波光粼粼，如同一面镜子，倒映着天空的云彩和两岸的绿树。偶尔几只水鸟掠过，划破水面的宁静，留下一串串涟漪。")
if has_flag("完成护城河") then
  return
end
avg_talk("司徒来也", "水寒刺骨，岂能畏寒？我们潜入这护城河中，避开城楼上守卫的锐利目光。")
avg_talk("朱鹮儿", "小(player:gname)，别忘了。我朱鹮儿可是水里的鱼儿，这点小河算什么？")
local stat = role_attr("司徒来也", stat_key.Speed)
local dodge_chance = math.floor(stat / 300 * 100) -- 速度属性影响潜水成功的概率
local options = {
  string.i18_format("潜水（{0}%概率成功，和速度有关）", dodge_chance),
  "离开",
}
local idx = show_quick_selections(options)
switch(idx) {
  ["1"] = function()
    if chance(dodge_chance) then
      avg_talk("", "你们潜入水中，河水冰冷刺骨，但心中却有一股暖流涌动。")
      avg_talk("朱鹮儿", "看，这不就过来了？")
      avg_talk("司徒来也", "好险！我们终于过来了，但这只是开始，后面的路还长着呢。")
      set_flag("完成护城河")
    else
      avg_talk("", "你们潜入水中，河水冰冷刺骨，水中暗流涌动，再向前恐有危险。")
      local ops = {
        "勇往直前",
        "暂时撤退",
      }
      local i = show_quick_selections(ops)
      switch(i) {
        ["1"] = function()
          -- 角色受到寒气刺骨的影响
          local joined_roles = roles_joined_dungeon("血色魔阵")
          for _, role in pairs(joined_roles) do
            role_add_affix(role, "寒气刺骨")
            pop_tip(string.i18_format("{0}获得了{1}", role.Name, affix_tip_link("寒气刺骨", "寒气刺骨", "#00DA2E")))
          end
          set_flag("完成护城河")
        end,
        ["2"] = function()
          avg_talk("", "你选择了暂时撤退，虽然心有不甘，但留得青山在，不怕没柴烧。")
        end
      }
    end
  end,
  ["2"] = function()
      avg_talk("", "你选择了知难而退，心中虽有不舍，但明白时机尚未成熟，待他日再图大业。")
      return
  end
}
