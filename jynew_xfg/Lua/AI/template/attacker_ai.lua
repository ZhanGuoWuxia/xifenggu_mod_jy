local ai_decision = require("AI/decisions")
local ai = class("attacker_ai", require('AI/template/ai_base'))

--发呆算分
local function daze_score(menpai)
    return math.random(1, 3)
end

--外交算分
local function diplomatic_score(menpai)
    return 100
end

--攻击算分
local function attack_score(menpai)
    local enemyCount = get_enemy_menpai_count(menpai)
    return 5 * enemyCount
end

ai.actions = {
    {
        getScore = diplomatic_score,
        name = "[quick]正在评估周边局势",
        execute = ai_decision.diplomatic
    },
    {
        getScore = attack_score,
        name = "[quick]正在考虑是否攻打敌对门派",
        execute = ai_decision.quick_attack
    },
    {
        getScore = daze_score,
        name = "[quick]正在举办宗门大比",
        execute = ai_decision.daze
    },
    {
        getScore = daze_score,
        name = "[quick]考虑结交一名盟友",
        execute = ai_decision.daze
    },
}

ai.maxActionCount = 2

return ai
