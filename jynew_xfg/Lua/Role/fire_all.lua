local mercenaries = table.cslist_2_table(player_mercenaries())
for _, mercenary in pairs(mercenaries) do
    pop_msg_box(string.i18_format("你的雇佣<color=#ff2400>{0}</color>因为无法支付佣金，已离开", mercenary.Name))
    player_fire_role(mercenary)
end
