local ai_decision = require("AI/decisions")
local ai = class("defender_ai", require('AI/template/ai_base'))

--发呆算分
local function daze_score(menpai)
    return math.random(1, 3)
end

--攻击算分
local function attack_score(menpai)
    local enemyCount = get_enemy_menpai_count(menpai)
    return 5 * enemyCount
end

ai.actions = {
    {
        getScore = attack_score,
        name = "正在考虑是否攻打敌对门派",
        execute = ai_decision.quick_attack
    },
    {
        getScore = daze_score,
        name = "正在和其他门派进行往来",
        execute = ai_decision.daze
    },
    {
        getScore = daze_score,
        name = "正在操练弟子",
        execute = ai_decision.daze
    },
    {
        getScore = daze_score,
        name = "正在大兴土木",
        execute = ai_decision.daze
    },
}

ai.maxActionCount = 2

return ai
