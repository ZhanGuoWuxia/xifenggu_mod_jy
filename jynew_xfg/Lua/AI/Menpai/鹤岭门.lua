local ai_decision = require("AI/decisions")
local ai = class("鹤岭门AI", require('AI/template/ai_base'))
local diplomatic = require("Common/diplomatic")

--发呆算分
local function daze_score(menpai)
  return math.random(1, 5)
end

--动态跟随玩家等级算分
local function adjust_score(menpai)
  return math.random(2, 6)
end

--外交算分
local function diplomatic_score(ai_menpai)
  local otherMenpais = get_unlocked_other_menpais(ai_menpai)
  local count = 0
  for _, menpai in pairs(otherMenpais) do
      local friendship = diplomatic.get_friendship(ai_menpai, menpai)
      if friendship <= -100 or friendship >= 100 then
          count = count + 1
      end
  end
  return 10 * count
end

--送礼算分
-- local function gift_score(ai_menpai)
--   return math.random(1, 5)
-- end

--恢复伤势算分
local function cure_score(menpai)
  local woundRoles = table.where(roles_of_menpai(menpai), function(r) return r.IsWound end)
  local cnt = #woundRoles
  if cnt <= 0 then
      return -999
  end
  return math.random(2, 6)
end

--攻击算分
local function attack_score(menpai)
  if chance(50) then
      return 0
  end
  local enemyCount = get_enemy_menpai_count(menpai)
  return math.random(3, 6) * enemyCount
end

ai.actions = {
  {
      getScore = diplomatic_score,
      name = "正在评估周边局势",
      execute = ai_decision.diplomatic
  },
  -- {
  --     getScore = gift_score,
  --     name = "正在送礼",
  --     execute = ai_decision.gift
  -- },
  -- {
  --     getScore = attack_score,
  --     name = "正在考虑是否攻打敌对门派",
  --     execute = ai_decision.quick_attack
  -- },
  {
      getScore = daze_score,
      name = "正在招募弟子",
      execute = ai_decision.add_random_disciple
  },
  {
      getScore = adjust_score,
      name = "西门坡正在操练下属",
      execute = ai_decision.adjust
  },
  {
      getScore = daze_score,
      name = "韩恭正在练习铁布衫",
      execute = ai_decision.daze
  },
  {
      getScore = daze_score,
      name = "赵让正在钻研水上漂",
      execute = ai_decision.daze
  },
  {
      getScore = cure_score,
      name = "西门霆正在疗伤",
      execute = ai_decision.cure
  },
}

ai.maxActionCount = 3
ai.MaxDynamicLevel = 10

return ai
