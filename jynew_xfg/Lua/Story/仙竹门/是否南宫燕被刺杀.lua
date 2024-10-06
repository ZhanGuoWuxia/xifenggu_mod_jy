local game_round = get_flag_int("小年失踪回合数")
return get_game_round() >= game_round + 3
