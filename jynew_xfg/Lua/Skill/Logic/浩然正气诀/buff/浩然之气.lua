local buff = buff_define("浩然之气")

--每回合结束时有{{[stat:int] * 0.1}}概率随机清除1层减益状态
local function buff_chance(args)
  local prob = role_stat(buff_arg_owner(args), stat_key.InnerStrength) * 0.1
  return chance(prob)
end

function buff:OnRoundEnd(args)
  local ownerId = self:GetBuffOwnerId(args)
  if buff_chance(args) then
    dispel_random_debuffs(ownerId, ownerId, 1)
  end
end

return buff