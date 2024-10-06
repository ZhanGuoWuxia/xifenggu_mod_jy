avg_talk("", "角楼，由巨大的石块砌成，经过岁月的洗礼，石面上布满了青苔，显得古旧而坚固。")
if has_flag("完成角楼") then
  return
end
local stat = role_attr("司徒来也", stat_key.qinggong)
local dodge_chance = math.floor(stat / 50 * 100) -- 轻功属性影响躲闪概率
avg_talk("", "突然，角楼暗处机簧声响，无数暗箭破空而出，直射而来！")
if chance(dodge_chance) then
  avg_talk("司徒来也", "好险！幸好我轻功高强，暗箭虽急，却难不倒我。")
  avg_talk("朱鹮儿", "这点小手段还难不倒我朱鹮儿，看我轻功。")
else
  avg_talk("", "你们反应稍慢，未能完全躲过暗箭，不幸中箭受伤！")
  local joined_roles = roles_joined_dungeon("血色魔阵")
  for _, role in pairs(joined_roles) do
    role:ChangeHealthStatus(math.clamp(role.HealthStatus - 0.2, 0, 1))
  end
  pop_tip("全部参战角色受伤")
  avg_talk("司徒来也", "这伤势不轻，需尽快处理，否则恐怕会影响接下来的行动。")
end
set_flag("完成角楼")
