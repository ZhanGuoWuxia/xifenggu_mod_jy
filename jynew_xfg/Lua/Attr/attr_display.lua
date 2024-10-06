local display_configs =
{
    [stat_key.Crit] = function(val)
        return string.i18_format("当前触发暴击的概率约为<color=#58c45f>{0:F1}%</color>", crit_rate(val))
    end,

    [stat_key.Dodge] = function(val)
        return string.i18_format("当前触发闪避的概率约为<color=#58c45f>{0:F1}%</color>", dodge_rate (val))
    end,

    [stat_key.Parry] = function(val)
        return string.i18_format("当前触发招架的概率约为<color=#58c45f>{0:F1}%</color>", cal_parry_rate (val, 0))
    end,

    [stat_key.Tenacity] = function(val)
        return string.i18_format("当前抵抗负面Buff概率约为<color=#58c45f>{0:F1}%</color>)", cal_resist_debuff_rate(val))
    end,

    [stat_key.fist] = function(val)
        return string.i18_format("当前拳法伤害提升约为<color=#58c45f>{0:P2}</color>", aptitude_to_dmg_scale(val))
    end,

    [stat_key.blade] = function(val)
        return string.i18_format("当前刀法伤害提升约为<color=#58c45f>{0:P2}</color>)", aptitude_to_dmg_scale(val))
    end,
        
    [stat_key.sword] = function(val)
        return string.i18_format("当前剑法伤害提升约为<color=#58c45f>{0:P2}</color>)", aptitude_to_dmg_scale(val))
    end,

    [stat_key.stick] = function(val)
        return string.i18_format("当前枪棍伤害提升约为<color=#58c45f>{0:P2}</color>)", aptitude_to_dmg_scale(val))
    end,

    [stat_key.neigong] = function(val)
        return string.i18_format("当前内功效果提升约为<color=#58c45f>{0:P2}</color>)", aptitude_to_dmg_scale(val))
    end,

    [stat_key.shot] = function(val)
        return string.i18_format("当前射术伤害提升约为<color=#58c45f>{0:P2}</color>)", aptitude_to_dmg_scale(val))
    end,

    [stat_key.qinggong] = function(val)
        return string.i18_format("当前暴击伤害提升约为<color=#58c45f>{0:P2}</color>)", aptitude_to_dmg_scale(val, QingGong2CritDamageRate, 1.5))
    end,
    
}

--获取属性附加展示文本
function get_attr_addition_text(attrId, attrValue)
    if display_configs[attrId] then
        return display_configs[attrId](attrValue)
    end
    return ""
end