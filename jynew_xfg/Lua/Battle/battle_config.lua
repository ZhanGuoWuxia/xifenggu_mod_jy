
stat_key =
{
        --当前生命值
        CurrentHp = "current_hp",

        --当前护盾
        Shield = "shield",

        --最大生命值
        MaxHp = "hp",

        --最大生命值百分比加成
        MaxHpPercent = "hp_percent",

        --当前内力
        CurrentMp = "current_mp",

        --最大内力
        MaxMp = "mp",

        --初始内力
        StartMp = "startmp",

        --每回合回复内力（集气)
        RecoverMp = "sp",

        --攻击
        Attack = "atk",

        --攻击力百分比
        AttackPercent = "atkper",

        --防御
        Defense = "def",

        DefensePercent = "defper",

        --速度
        Speed = "spd",

        SpeedPercent = "spdper",

        --暴击
        Crit = "crt",

        CritDefense = "crd",

        --暴击伤害加成
        CritDamageRate = "crtdmgrate",

        --闪避
        Dodge = "dodge",

        --破闪避
        AntiDodge = "antidodge",

        --破招架
        AntiParry = "antiparry",

        --招架
        Parry = "parry",

        --韧性
        Tenacity = "ten",

        TenacityPercent = "tenper",

        --内劲
        InnerStrength = "int",

        InnerStrengthPercent = "intper",

        DoDamageModifier = "伤害修正",
        ReceiveDamageModifer = "被伤害修正",
        DoHealModifier = "治疗修正",
        ReceiveHealModifier = "被治疗修正",

        fist = "拳法资质",

        stick = "棍法资质",

        blade = "刀法资质",

        sword = "剑法资质",

        neigong = "内功资质",

        qinggong = "轻功资质",
        
        shot = "射术资质",

        PoisonDamage = "修正中毒伤害",
        BleedDamage = "修正流血伤害",
}


--队伍位置
--[[ 左边     右边
    2 1 0 || 0 1 2
    5 4 3 || 3 4 5
    8 7 6 || 6 7 8
--]]
TeamPos =
{
  FrontUp = 0,
  Up = 1,
  BackUp = 2,
  Front = 3,
  Center = 4,
  Back = 5,
  FrontBottom = 6,
  Bottom = 7,
  BackBottom = 8,

  all_positions = function(self)
      local res = {}
      for i = 0, MAX_TEAM_ROW - 1 do
        for j = 0, MAX_TEAM_COL - 1 do
           local pos = j + i * MAX_TEAM_ROW
           res[#res + 1] = pos
        end
      end
      return res
  end
}

MAX_TEAM_ROW = 3
MAX_TEAM_COL = 3


WoundStatus = {
  --重伤
  {LessThanValue = 25, WoundValue = 25},
  --普通伤
  {LessThanValue = 60, WoundValue = 10},
  --轻伤
  {LessThanValue = 90, WoundValue = 5},
}
