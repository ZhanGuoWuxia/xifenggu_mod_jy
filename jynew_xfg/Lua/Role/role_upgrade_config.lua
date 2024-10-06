local attr_configs = 
{
    options = 
    {
       {name = "强化 最大生命值", attr = {attr_key = stat_key.MaxHp, value = 250}},
       {name = "强化 攻击力",   attr = {attr_key = stat_key.Attack, value = 75}},
       {name = "强化 防御力",   attr = {attr_key = stat_key.Defense, value = 75}},
       {name = "强化 最大内力", attr = {attr_key = stat_key.MaxMp, value = 10}},
       {name = "强化 集气",     attr = {attr_key = stat_key.RecoverMp, value = 1}},
       {name = "强化 内劲",     attr = {attr_key = stat_key.InnerStrength, value = 75}},
       {name = "强化 韧性",     attr = {attr_key = stat_key.Tenacity, value = 75}},
       {name = "强化 暴击",     attr = {attr_key = stat_key.Crit, value = 75}},
       {name = "强化 闪避",     attr = {attr_key = stat_key.Dodge, value = 66}},
       {name = "强化 招架",     attr = {attr_key = stat_key.Parry, value = 66}},
       {name = "算了(返回上一级", attr = {attr_key = "", value = ""}},
    },
    as_selections = function(self)
       local res = {}
       for i, v in ipairs(self.options) do
         res[i] = string.i18_format("{0} +<color=#00da2e>{1}</color>", v.name, v.attr.value)
       end
       return res
    end
 }


 return {
    attr_configs = attr_configs,
 }