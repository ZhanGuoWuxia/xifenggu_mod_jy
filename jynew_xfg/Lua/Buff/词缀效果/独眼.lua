local buff = buff_define("独眼")

function buff:OnAdd(args)
  local OwnerId = self:GetBuffOwnerId(args)
  add_buff("命中弱化", OwnerId, OwnerId, 20, 5)
end

function buff:OnBeDodged(args)
  local OwnerId = self:GetBuffOwnerId(args)
  self:NotifyTriggered(args, OwnerId, OwnerId)
end

return buff
