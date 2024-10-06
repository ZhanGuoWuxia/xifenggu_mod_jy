local ai_decision = require("AI/decisions")
local ai = class("evener_ai", require('AI/template/ai_base'))

--发呆算分
local function daze_score(menpai)
    return math.random(1, 3)
end

--攻击算分
local function attack_score(menpai)
    local enemyCount = get_enemy_menpai_count(menpai)
    return 5 * enemyCount
end

--主线剧情触发算分
local function story_score(menpai)
    local story = next_menpai_story(menpai)
    if story then
        return math.maxinteger
    end
    return 0
end

ai.actions = {
    {
        getScore = attack_score,
        name = "正在考虑是否攻打敌对门派",
        execute = ai_decision.quick_attack
    },
    {
        getScore = daze_score,
        name = "正在训练新弟子",
        execute = ai_decision.daze
    },
    {
        getScore = daze_score,
        name = "正在采购新物资",
        execute = ai_decision.daze
    },
    {
        getScore = daze_score,
        name = "正在进行武术交流",
        execute = ai_decision.daze
    },
}

ai.maxActionCount = 2

return ai
