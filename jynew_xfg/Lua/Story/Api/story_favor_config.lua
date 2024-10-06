--剧情好感度的一些通用配置

local MaxFavorLevel = 3

local favor_text_config = {
    default = {
        [-3] = "死仇",
        [-2] = "怨恨",
        [-1] = "厌恶",
        [0] = "陌生",
        [1] = "友善",
        [2] = "亲密",
        [3] = "至交"
    },
    ["司徒来也"] = {
        [-3] = "<color=red>走火入魔</color>",
        [-2] = "愤恨",
        [-1] = "怀疑",
        [0] = "正常",
        [1] = "舒心",
        [2] = "愉悦",
        [3] = "斗志昂扬"
    }
}

function get_favor_level(favor)
    local level = math.clamp(favor // MaxRoleFavorPerLevel, -MaxFavorLevel,MaxFavorLevel)
    return level
end

function get_favor_level_name(favor, roleId)
    roleId = tostring(roleId)
    local level = get_favor_level(favor)
    local favor_table = favor_text_config[roleId] ~= nil and favor_text_config[roleId] or favor_text_config.default
    if favor_table and favor_table[level] then
        return favor_table[level]
    end
    return '???'
end