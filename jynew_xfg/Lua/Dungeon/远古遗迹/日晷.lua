avg_talk("", "一尊历经沧桑的日晷静静地矗立在那里，日影斜照，似乎指向了一条通往未知秘境的幽深秘道。")
if has_flag("完成日晷") then
  return
end
local options = {
  "早上",
  "中午",
  "晚上",
}
local idx = show_avg_select("", "日晷上的斜影，究竟是指向何时的天光？", options)
switch(idx) {
    ["1"] = function()
      avg_talk("", "你轻触那晨光中的影子，感受到一股清新的力量涌入体内，仿佛获得了新的生机。")
      -- 角色受到晨光的影响
      local joined_roles = roles_joined_dungeon("远古遗迹")
      for _, role in pairs(joined_roles) do
        role_add_affix(role, "晨光")
        pop_tip(string.i18_format("{0}获得了{1}", role.Name, affix_tip_link("晨光", "晨光", "#00DA2E")))
      end
    end,
    ["2"] = function()
      avg_talk("", "你手掌覆上那烈日下的影子，体温上升，内力在体内沸腾，似乎变得更加强大。")
      -- 角色受到烈日的影响
      local joined_roles = roles_joined_dungeon("远古遗迹")
      for _, role in pairs(joined_roles) do
        role_add_affix(role, "烈日")
        pop_tip(string.i18_format("{0}获得了{1}", role.Name, affix_tip_link("烈日", "烈日", "#00DA2E")))
      end
    end,
    ["3"] = function()
      avg_talk("", "你轻抚那余晖中的影子，身体轻盈，心灵宁静，仿佛进入了冥想的状态。")
      -- 角色受到余晖的影响
      local joined_roles = roles_joined_dungeon("远古遗迹")
      for _, role in pairs(joined_roles) do
        role_add_affix(role, "余晖")
        pop_tip(string.i18_format("{0}获得了{1}", role.Name, affix_tip_link("余晖", "余晖", "#00DA2E")))
      end
    end,
}


set_flag("完成日晷")