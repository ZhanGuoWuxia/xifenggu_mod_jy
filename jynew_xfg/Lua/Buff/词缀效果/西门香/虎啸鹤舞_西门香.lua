--在心仪之人后面时，自己提升伤害20%
local buff = buff_define("虎啸鹤舞_西门香")

local GiveDamageFactor = 0.2

function buff:BeforeGiveDamage(args)
  local OwnerId = self:GetBuffOwnerId(args)
  local dmgInfo = args.DamageInfo
  if is_role_of_beanId(alive_role_of_front(OwnerId), "司徒来也") then
    dmgInfo.DamageRatio = dmgInfo.DamageRatio + GiveDamageFactor
  end
end

function buff:OnOtherDeath(args)
  local OwnerId = self:GetBuffOwnerId(args)
  if not is_role_in_team("司徒来也", team_of_role(OwnerId)) then
    remove_buff("虎啸鹤舞_西门香", OwnerId, OwnerId)
  end
end

return buff