local ai_decision = require("AI/decisions")
local diplomatic = require("Common/diplomatic")
local ai = class("jy_menpaiAI", require('AI/template/ai_base'))

--发呆算分
local function daze_score(menpai)
    return math.random(1, 10)
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


local function roundAction(menpai, ai)
    --随机调整所有门派好感
    for k,other_menpai in pairs(get_other_menpais(menpai)) do
        local fovChanged = math.random(-30,30)
        if(other_menpai == get_player_menpai()) then
            --与玩家门派不要变化如此剧烈
            fovChanged = math.random(-3,3) 
        end
        local friendship = diplomatic.get_friendship(menpai, other_menpai)
        diplomatic.set_friendship(menpai, other_menpai, friendship + fovChanged)
    end

    --评估外交
    ai_decision.diplomatic(menpai, ai)

    --厉兵秣马
    ai_decision.adjust(menpai, ai)
end

ai.actions = {
    {
        getScore = diplomatic_score,
        name = "[quick]正在评估周边局势",
        execute = roundAction
    },
    {
        getScore = attack_score,
        name = "[quick]正在考虑是否攻打敌对门派",
        execute = ai_decision.quick_attack
    },
    {
        getScore = daze_score,
        name = "[quick]正在思考下一步计划",
        execute = ai_decision.daze
    },
    {
        getScore = daze_score,
        name = "[quick]正在埋头发展",
        execute = ai_decision.build
    },
    {
        getScore = daze_score,
        name = "[quick]正在招募弟子",
        execute = ai_decision.add_random_disciple
    },
}

ai.maxActionCount = 3
ai.MaxDynamicLevel = 30

return ai
