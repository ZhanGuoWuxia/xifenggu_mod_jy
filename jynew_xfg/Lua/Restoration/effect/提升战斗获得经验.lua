--剧情待补充
local percent = 0.2
set_float(restore_modifer_key.add_exp_percent, percent)
play_sfx("Tip/Tip1.wav")
pop_msg_box(string.i18_format("战斗经验获取提升{0}%", math.floor(percent * 100) ))
