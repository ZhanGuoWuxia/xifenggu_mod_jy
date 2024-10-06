local other_menpais = table.select(get_strategy_other_menpais(get_player_menpai()), function(menpai) return menpai.Name end)

local idx = show_avg_select("", "请选择你勒索抢劫的门派。（勒索抢劫成功概率取决于等级对比）", other_menpais)

avg_talk("", "你率领手下闯入敌派的领地，毫不掩饰你的贪婪和野心，直接向他们索要财物。")

local diplomatic = require("Common/diplomatic")
local playerMenpai = get_player_menpai()
local targetMenpai = get_menpai_by_id(other_menpais[idx])
local evaluation = diplomatic.evaluate(playerMenpai, targetMenpai)
local baseAddition = current_difficult_param(DIFFICULT_PARAM_KEY.StrategyAddition)

local isOk = chance((evaluation / MaxRoleLevel + baseAddition) * 100)

if isOk then
    avg_talk("", "你的勒索行为让对方敢怒不敢言，他们屈服了你的淫威！")
    add_player_money(get_game_round() * 100)
    play_sfx("Tip/Tip1.wav")
else
    avg_talk("", "你的勒索行为在对方看来相当可笑，他们扬言要让你为此付出代价。")
end
pop_tip("你的行为彻底激怒了对方，双方的关系进一步恶化。")
change_both_friendship(playerMenpai, targetMenpai, -30)
set_flag("该回合已经勒索抢劫")
