--剧情待补充
local chance = 20
set_float(restore_modifer_key.prisoner_chance, chance)
play_sfx("Tip/Tip1.wav")
pop_msg_box(string.i18_format("战斗后抓捕囚犯概率提升{0}%", chance))
