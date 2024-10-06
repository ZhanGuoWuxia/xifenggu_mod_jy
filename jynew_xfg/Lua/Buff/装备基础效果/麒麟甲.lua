local buff = buff_define("麒麟甲")
--受击时有20%概率获得1层[祥瑞]，持续2回合

local probability = 20

function buff:OnHit(args)
  local ownerId = self:GetBuffOwnerId(args)
  if chance(probability) then
    add_buff("祥瑞", ownerId, ownerId, 1, 2)
  end
end

return buff