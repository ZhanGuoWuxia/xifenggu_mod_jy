--战斗相关数据的计算公式



local function check_valid(n)
    if math.is_nan(n) or n == math.huge or n == -math.huge then
        return 0
    end
    return n
end

--评估角色的伤势
function get_wound_value(targetStatus)
    local res = 0
    local conditions = WoundStatus
    for i = 1, #conditions do
        if targetStatus < conditions[i].LessThanValue then
            res = conditions[i].WoundValue
            break
        end
    end
    return res
end

--获取敌人提供的等级经验
function exp_of_role_provide(enemyRole)
    local exp = level_2_role_exp(enemyRole.Level)
    local res = math.round(exp * math.random_float(0.95, 1.05))
    return res
end

--level转化为经验
function level_2_role_exp(level)
    local res = 0
    if level <= 5 then
        res = 28.5 * level * level - 81.4 * level + 85
    elseif level <= 20 then
        res = 200 * level - 600
    else
        res = 400 * level - 4400
    end
    return math.round(res)
end

--获取战斗后某个技能获得的技能经验
function get_battle_role_skill_exp(battleRole, skill)
    --角色等级越高练得越快（后期加速下）
    local rolelevelScale = math.max(0, battleRole.Level / 15)
    return math.round(math.random(25 , 35) * (1 + rolelevelScale))
end

--获取角色资质对武学类型的伤害缩放
function get_dmg_scale_of_aptitude(battleSkill, battleRole)
    local res = 0
    local statKeyToScale = nil
    if battleSkill:IsSkillType("WaiGong") then
        if battleSkill:IsSubSkillType("fist") then
            statKeyToScale = stat_key.fist
        elseif battleSkill:IsSubSkillType("blade") then
            statKeyToScale = stat_key.blade
        elseif battleSkill:IsSubSkillType("sword") then
            statKeyToScale = stat_key.sword
        elseif battleSkill:IsSubSkillType("shot") then
            statKeyToScale = stat_key.fist
        elseif battleSkill:IsSubSkillType("stick") then
            statKeyToScale = stat_key.stick
        end
    elseif battleSkill:IsSkillType("NeiGong") then
        statKeyToScale = stat_key.neigong
    end
    if statKeyToScale then
        res = aptitude_to_dmg_scale(battleRole:GetStat(statKeyToScale))
    end
    return res
end

function aptitude_to_dmg_scale(statvalue, aptitude_factor, maxScale)
    maxScale = maxScale or 0.5
    aptitude_factor = aptitude_factor or 0.1
    local res = math.min(maxScale, statvalue * aptitude_factor * 0.01)
    return res
end

--角色升级所需经验
function exp_of_role_levelup(level)
    local exp = 0
    if level <= 10 then
        exp = 27 * level * level + 23 * level
    elseif level <= 20 then
        exp = 600 * level - 1800
    else
        exp = 1200 * level - 13200
    end
    return math.round(exp)
end

--武学升级所需经验
function exp_of_skill_levelup(skill, nextlevel)
    local RequireExp =  exp_of_skillLevel(nextlevel - 1)
    return math.round(RequireExp * skill.HardFactor)
end

function exp_of_skillLevel(level)
    local RequireExp =  12.57 * math.max(1, level) + 12.47
    return math.round(RequireExp)
end

--减伤公式
function damage_reduce(...)
    local defense = select(1, ...)
    local attack = select(2, ...)
    local atkerLevel = select(3, ...)
    local defenderLevel = select(4, ...)
    local levelDiff = math.max(0,((defenderLevel-atkerLevel) / 50))
    local res = check_valid( 1 - attack / (attack + defense * 0.5) + levelDiff)
    print("减伤:" .. res)
    return math.clamp(res, 0, 1)
end

--暴击概率公式
function crit_rate(...)
    local crit_level = select(1, ...)
    return math.clamp(crit_level / 10, 0, 100)
end

--抗暴击概率公式
function crit_defense_rate(...)
    local crit_defense_level = select(1, ...)
    local x = 0.6 * crit_defense_level / (crit_defense_level + 180)
    return math.clamp(x, 0, 1)
end

function level_grow_formula(base, grow, level)
    return base + grow * (level > 1 and level - 1 or 0)
end

function formula_skill_chance(baseval, factor1, factor2)
    return baseval + factor1 * factor2
end

---@param anti_dodge float 攻击者破闪避值
---@param dodge float 防御者闪避值
function cal_hit_rate(anti_dodge, dodge)
    local res =  100 - dodge_rate(dodge - anti_dodge)
    return res
end

--计算韧性抵抗率
function cal_resist_debuff_rate(val)
    return math.clamp(math.max(0, val) / 10, 0, 100)
end

function dodge_rate(val)
    return math.clamp(math.max(0, val) / 10, 0, 100)
end

--招架概率公式
function cal_parry_rate(parry, antiparry)
    if antiparry < 0 then
        antiparry = 0
    end
    local parry_level = math.max(0, parry - antiparry)
    return parry_rate(parry_level)
end

function parry_rate(val)
    return math.clamp(val / 10, 0, 100)
end
