local diplomatic = require("Common/diplomatic")

local function decision_daze(myMenpai, ai)
    -- 发呆
end

--建造
local function decision_build(myMenpai, ai)
    local areas = areas_of_menpai(myMenpai)
    if areas and #areas > 0 then
        local areaToBuild = table.pick_random(areas)
        if areaToBuild then
            change_area_develop(areaToBuild, math.random(1, 2))
        end
    end
end

--治疗下属
local function decision_cure(myMenpai, ai)
    local baseCureValue = current_difficult_param(DIFFICULT_PARAM_KEY.CureStatus)
    -- body
    local roles = roles_of_menpai(myMenpai)
    for _, role in pairs(roles) do
        if role.IsWound then
            cure_wound(role, math.random(30, 75) + baseCureValue)
        end
    end
end

--动态调整
local function decision_adjust(myMenpai, ai)
    local player_menpai = get_player_menpai()
    if player_menpai == nil or myMenpai == player_menpai then
        return
    end
    local scaleFactor = ai:get_difficult_scale_factor()
    local maxLevel = ai.MaxDynamicLevel or MaxRoleLevel
    scaleFactor = scaleFactor or 1
    local roles = roles_of_menpai(myMenpai)
    local waigong_level = math.round(player_menpai:MedianOfWaiGongLevel() * scaleFactor)
    local neigong_level = math.round(player_menpai:MedianOfNeiGongLevel() * scaleFactor)
    local qinggong_level = math.round(player_menpai:MedianOfQingGongLevel() * scaleFactor)
    local role_level = math.round(player_menpai:MedianOfRoleLevel() * scaleFactor)
    role_level = math.clamp( role_level, 1, maxLevel)
    --开始调整角色等级和武学等级
    for id, role in pairs(roles) do
        role:TryLevelUpSkillAtPos(0, waigong_level)
        role:TryLevelUpSkillAtPos(1, neigong_level)
        role:TryLevelUpSkillAtPos(2, qinggong_level)
        role:TryChangeLevelTo(role_level)
    end
end


--触发可用的门派剧情
local function decision_triggerstory(myMenpai)
    local action = next_menpai_story(myMenpai)
    if not action then
        return
    end
    local luaCommandFile = action.LuaCommandFile
    if luaCommandFile == nil or luaCommandFile == "" then
        return
    end
    show_menpai_action(myMenpai, "思考中")
    executefile(luaCommandFile)
end

--夺回建筑
local function decision_recapture_building(myMenpai)
    for _, id in pairs(myMenpai.Areas) do
        local area = get_area(id)
        if area ~= nil then
            local enemy_building = get_enemy_building_of_area(area)
            if enemy_building ~= nil then
                local attackedMenpai = building_attacker_of_area(area)
                if attackedMenpai ~= nil then
                    show_battle_route(area.Id, area.Id)
                    local ret = menpai_battle_recapture(myMenpai, attackedMenpai)
                    switch(ret) {
                        ["1"] = function()
                            recapture_building(myMenpai, area)
                        end,
                        ["default"] = function()
                            pop_tip(myMenpai.Name .. "夺回据点建筑失败")
                        end
                    }
                    return true
                end
            end
        end
    end
end

--攻击攻击一个敌对势力的随机相邻地块
function decision_attack_neighbor_area(myMenpai)
    --获取指定门派的全部敌对势力边界相邻地块
    local neighbors = {} --key: 相邻地块Id, value: areaId
    local neighborIds = {}
    for _, id in pairs(myMenpai.Areas) do
        local area = get_area(id)
        for _, n in pairs(get_neighbors(area)) do
            if n ~= nil then
                for _, menpai in pairs(get_enemy_menpais(myMenpai)) do
                    if menpai ~= nil and n.Owner == menpai.InstanceId then
                        --判断是否已经在neighbors中
                        if neighbors[n.Id] == nil then
                            neighborIds[#neighborIds + 1] = n.Id
                            neighbors[n.Id] = area.Id
                        end
                    end
                end
            end
        end
    end

    if #neighborIds <= 0 then
        print("没地可以打了")
        return
    end

    math.randomseed(os.time())
    --随机选择一个敌对势力的相邻地块
    local attackAreaId = neighborIds[math.random(1, #neighborIds)]
    --获取开始攻击的地块
    local startAreaId = neighbors[attackAreaId]
    local attackArea = get_area_by_id(attackAreaId)
    show_battle_route(startAreaId, attackAreaId)
    local ret = menpai_battle_by_area(myMenpai, attackArea)
    if ret == 1 then
        --攻打成功
        occupy_building(myMenpai, attackArea)
    else
        pop_tip(myMenpai.Name .. " 攻打地点失败了")
    end
end

--快速攻击
local function decision_quick_attack(myMenpai)
    --50%概率考虑夺回建筑
    --如果执行了夺回建筑，就不再执行快速攻击
    --如果没有执行夺回建筑，就执行快速攻击
    local is_attack_building = chance(50)
    if is_attack_building then
        if not decision_recapture_building(myMenpai) then
            decision_attack_neighbor_area(myMenpai)
        end
    else
        decision_attack_neighbor_area(myMenpai)
    end
end

local function get_max_score_action(actions, menpai)
    local idx = -1
    local curScore = -999

    for i = 1, #actions do
        local actionScore = actions[i].getScore(menpai)
        if actionScore > curScore then
            curScore = actionScore
            idx = i
        end
    end

    local res = nil
    if idx > 0 then
        res = actions[idx]
        table.remove(actions, idx)
    end
    return res
end

local function add_new_disciple(menpai, id)
    local role = add_disciple_by_id(menpai, id)
    if role then
        show_menpai_action(menpai, string.i18_format("[quick]{0} 加入了 {1}", role.Name, menpai.Name))
    end
end

local function decision_add_random_disciple(menpai)
    local role = add_random_disciple(menpai)
    if role then
        show_menpai_action(menpai, string.i18_format("[quick]{0} 加入了 {1}", role.Name, menpai.Name))
    end
end

local function decision_diplomatic(ai_menpai)
    --外交
    --如果好感度小于等于-100，则宣战
    --如果好感度大于等于100，则结盟
    local otherMenpais = get_unlocked_other_menpais(ai_menpai)
    for _, menpai in pairs(otherMenpais) do
        local relation = diplomatic.current_relation(ai_menpai, menpai)
        --如果已经非中立了则跳出
        if relation ~= 0 then
            return
        end
        local friendship = diplomatic.get_friendship(ai_menpai, menpai)
        if friendship <= -100 then
            --宣战
            diplomatic.declare_war(ai_menpai, menpai)
        elseif friendship >= 100 then
            --结盟
            if menpai == get_player_menpai() then
                if yes_or_no(string.i18_format("{0} 请求与你缔结同盟, 是否同意？", ai_menpai.Name)) then
                    diplomatic.make_ally(ai_menpai, menpai)
                end
            else
                diplomatic.make_ally(ai_menpai, menpai)
            end
        end
    end
end

local function decision_gift(ai_menpai)
    --送礼
    --好感度排序，好感度越高优先选择送礼，送到100则开始给下一个送
    local other_menpais = get_unlocked_other_menpais(ai_menpai)
    -- 对门派按好感度进行排序
    table.sort(other_menpais, function(a, b)
        return diplomatic.get_friendship(ai_menpai, a) > diplomatic.get_friendship(ai_menpai, b)
    end)
    for _, menpai in pairs(other_menpais) do
        local friendship = diplomatic.get_friendship(ai_menpai, menpai)
        -- 如果好感度小于100，尝试送礼
        if friendship < 100 then
            local point = 10
            local gift_success = diplomatic.give_gift(ai_menpai, menpai, point)
            if gift_success > 0 then
                show_menpai_action(ai_menpai, string.i18_format("{0}向{1}送出了礼物", ai_menpai.Name, menpai.Name))
                local economy = require("Common/economy")
                local cost = economy.cost_of_gift()
                add_money(menpai, cost)
                break
            end
        end
    end
end

return {
    trigger_story = decision_triggerstory,
    quick_attack = decision_quick_attack,
    cure = decision_cure,
    daze = decision_daze,
    adjust = decision_adjust,
    build = decision_build,
    get_max_score_action = get_max_score_action,
    add_new_disciple = add_new_disciple,
    add_random_disciple = decision_add_random_disciple,
    diplomatic = decision_diplomatic,
    gift = decision_gift
}
