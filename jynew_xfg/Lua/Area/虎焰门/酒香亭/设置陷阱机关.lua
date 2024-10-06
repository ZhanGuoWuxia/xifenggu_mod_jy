local other_menpais = table.select(get_strategy_other_menpais(get_player_menpai()), function(menpai) return menpai.Name end)

local idx = show_avg_select("", "请选择你设置陷阱机关的门派。（设置成功概率取决于等级对比）", other_menpais)
avg_talk("", "你如同幽灵般悄无声息地潜入了敌派的深处，巧妙地布置了一系列隐蔽的陷阱机关，准备给敌人一个意外的惊喜。")

local diplomatic = require("Common/diplomatic")
local playerMenpai = get_player_menpai()
local targetMenpai = get_menpai_by_id(other_menpais[idx])
local evaluation = diplomatic.evaluate(playerMenpai, targetMenpai)
local baseAddition = current_difficult_param(DIFFICULT_PARAM_KEY.StrategyAddition)

local isOk = chance((evaluation / MaxRoleLevel + baseAddition) * 100)

if isOk then
    avg_talk("", "你的陷阱机关发挥了作用，敌派的门人不慎落入其中，造成了不小的混乱和伤害！")
    local allRoles = table.cslist_2_table(roles_of_menpai(targetMenpai))
    local num = math.floor(#allRoles / 5)
    local roles = table.pick_random_many(allRoles, num)
    for _, role in pairs(roles) do
        role:ChangeHealthStatus(math.clamp(role.HealthStatus - 0.2, 0, 1))
        pop_tip(string.i18_format("<color=#ff7a00>{0}</color>受到了伤害！", role.Name))
    end
    play_sfx("Tip/Tip1.wav")
else
    avg_talk("", "你的陷阱机关虽然巧妙，但似乎并未能困住狡猾的敌人。他们似乎早已看穿了你的计划。")
end
pop_tip("你的行动似乎激怒了对方，双方的关系进一步恶化。")
change_both_friendship(playerMenpai, targetMenpai, -20)
set_flag("该回合已经设置陷阱机关")
