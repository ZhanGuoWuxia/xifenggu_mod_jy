local buff = buff_define("天罡戒")
--战斗开始时会生成一道罡气，首次受到伤害时消失

function buff:OnAdd(args)
  local OwnerId = self:GetBuffOwnerId(args)
  add_buff("罡气", OwnerId, OwnerId)
end

--被攻击了会被移除
function buff:OnHit(args)
  local OwnerId = self:GetBuffOwnerId(args)
  remove_buff("罡气", OwnerId, OwnerId)
end

return buff