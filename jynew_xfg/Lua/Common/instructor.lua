
local Develop2AffixCountDivide = 30

local function train_count_of_role(develop)
    local count_based_on_develop = math.round(develop / 5)
    local minCount = 3
    local maxCount = minCount + count_based_on_develop
    return math.max(minCount, maxCount)
end

local function skill_exp_of_train_role(role)
    local base_exp = role.Level * 10 + 15
    local result = math.round(math.random_float(0.5, 1.1) * base_exp)
    return result
end


local function gen_affix_via_develop_point(role, develop)
    local genCount = math.max(1 , 1 + (develop // Develop2AffixCountDivide))
    for i = 1, genCount do
        role_add_affix(role, "random")
    end
end



return {
    skill_exp_of_train_role = skill_exp_of_train_role,
    gen_affix_via_develop_point = gen_affix_via_develop_point,
    train_count_of_role = train_count_of_role,
}
