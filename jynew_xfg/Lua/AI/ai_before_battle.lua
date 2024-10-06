local territory = current_territory

if not territory then
  return
end

local attackMenpai = territory.Attacker
local defenderMenpai = territory.Defender

local playerMenpai = get_player_menpai()

if playerMenpai ~= attackMenpai and playerMenpai ~= defenderMenpai then
  return
end

--盟友助阵选择
local allied_menpais = get_allied_menpais(playerMenpai)
if allied_menpais.Count <= 0 then
  return
end
local options = table.select(table.cslist_2_table(allied_menpais), function(menpai) return menpai.Name end)
table.insert(options, i18n_text("放弃"))
local idx = show_avg_select("", "请选择你的盟友。（盟友助阵概率取决于好感度和等级对比）", options)
if idx == #options then
  return
end
set_flag_int("盟友索引", idx - 1)
