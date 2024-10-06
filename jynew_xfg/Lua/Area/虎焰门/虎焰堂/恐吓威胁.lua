local other_menpais = table.select(get_strategy_other_menpais(get_player_menpai()), function(menpai) return menpai.Name end)

local idx = show_avg_select("", "请选择你恐吓威胁的门派。（恐吓威胁成功概率取决于等级对比）", other_menpais)

avg_talk("", "你大胆地踏入敌派的领地，毫不掩饰你的敌意，用冷峻的眼神和强硬的言辞向他们发出了威胁。")

local diplomatic = require("Common/diplomatic")
local playerMenpai = get_player_menpai()
local targetMenpai = get_menpai_by_id(other_menpais[idx])
local evaluation = diplomatic.evaluate(playerMenpai, targetMenpai)
local baseAddition = current_difficult_param(DIFFICULT_PARAM_KEY.StrategyAddition)

local isOk = chance((evaluation / MaxRoleLevel + baseAddition) * 100)

if isOk then
    avg_talk("", "你的威胁让敌方心生恐惧，他们有些人开始怀疑自己的实力，竟不敢与你对战！")
    --敌方阵容上限-1
    local faction_control = require("Common/faction")
    local num = faction_control.get_menpai_flag_int(targetMenpai, "阵容上限减少人数")
    faction_control.set_menpai_flag_int(targetMenpai, "阵容上限减少人数", num + 1)
    pop_tip(string.i18_format("{0}阵容上限减少{1}人！", targetMenpai.Name, num + 1))
    play_sfx("Tip/Tip1.wav")
else
    avg_talk("", "你的威胁在敌方看来就是小丑跳梁。他们警告你不要再轻举妄动！")
end
pop_tip("你的行动似乎激怒了对方，双方的关系进一步恶化。")
change_both_friendship(playerMenpai, targetMenpai, -20)
set_flag("该回合已经恐吓威胁")
