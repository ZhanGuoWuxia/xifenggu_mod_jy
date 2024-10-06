--剧情待补充
local percent = 0.2
set_float(restore_modifer_key.build_cost_discount, 0.2)
play_sfx("Tip/Tip1.wav")
pop_msg_box(string.i18_format("建设费用现在降低了{0}%", math.floor(percent * 100) ))
