--剧情待补充
local percent = 0.2
set_float(restore_modifer_key.income, 0.2)
play_sfx("Tip/Tip1.wav")
pop_msg_box(string.i18_format("领地现在会提供额外{0}%收入", math.floor(percent * 100) ))
