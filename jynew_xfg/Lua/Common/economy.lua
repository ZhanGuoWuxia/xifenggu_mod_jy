--计算某个地块带来的收入
local function income_of_area(area)
    if not area then
        return 0
    end
    local areaDevelop = area.Develop
    local count = 0
    for _, building in pairs(area.Buildings) do
        if building.Owner == area.Owner then
            count = count + 1
        end
    end
    local res =  4 * areaDevelop + count * 100 * (areaDevelop / MaxAreaDevelop)
    res = res * (1 + current_difficult_param(DIFFICULT_PARAM_KEY.AreaIncomePlus))
    return math.floor(res)
end

local function income_of_hunt(area)
    if not area then
        return 0
    end
    local areaDevelop = area.Develop
    local k = 7 *  math.max(1, (areaDevelop - 20) // 5)
    local res = k * areaDevelop
    res = res * (1 + current_difficult_param(DIFFICULT_PARAM_KEY.AreaIncomePlus)) * math.random_float(0.9, 1.1)
    return math.floor(res)
end

--建设地块所需银两
local function cost_of_build_area(area)
    if not area then
        return 0
    end
    local develop = area.Develop
    local k = 7 *  math.max(1, (develop - 20) // 5)
    local cost = math.floor(k * develop * math.max(0, 1 - get_float(restore_modifer_key.build_cost_discount)))
    return cost
end

--地块发展度提供的额外角色等级
local function addition_role_level_of_develop(area)
    if not area then
        return 0
    end
    return area.Develop // 25
end

--训练角色所需银两
local function cost_of_train_role(role)
    if not role then
        return 0
    end
    return role.Level * 35
end

local function commission_of_mercenary(mercenary)
    if not mercenary then
        return 0
    end
    return 50 * (mercenary.Level - 1)
end

local function cost_of_xiulian()
    return 1000
end

--重随角色词缀所需银两
local function cost_of_reroll_affix()
    return 1000
end

--计算门派当前的总收入
local function income_of_menpai(menpai)
    local areas = areas_of_menpai(menpai)
    local income = 0
    for _, area in pairs(areas) do
        income = income + income_of_area(area)
    end
    income = math.floor(income * (1 + get_float(restore_modifer_key.income)))
    return income
end

--计算门派当前的总佣金
local function commission_of_menpai(menpai)
    local mercenaries = table.cslist_2_table(mercenaries_of_menpai(menpai))
    local commission = 0
    for _, mercenary in pairs(mercenaries) do
        commission = commission + commission_of_mercenary(mercenary)
    end
    return commission
end

local function cost_of_recruit_role(rolelevel)
    return rolelevel * 100
end

--计算物品的价格
local function cost_of_strange_seller()
	local game_round = get_game_round()
    return 100 * game_round
end

local function cost_of_gift()
    return 1000
end

return
{
    income_of_area = income_of_area,
    income_of_hunt = income_of_hunt,
    income_of_menpai = income_of_menpai,
    commission_of_menpai = commission_of_menpai,
    cost_of_build_area = cost_of_build_area,
    cost_of_recruit_role = cost_of_recruit_role,
    cost_of_train_role = cost_of_train_role,
    cost_of_reroll_affix = cost_of_reroll_affix,
    cost_of_xiulian = cost_of_xiulian,
    cost_of_strange_seller = cost_of_strange_seller,
    addition_role_level_of_develop = addition_role_level_of_develop,
    cost_of_gift = cost_of_gift
}
