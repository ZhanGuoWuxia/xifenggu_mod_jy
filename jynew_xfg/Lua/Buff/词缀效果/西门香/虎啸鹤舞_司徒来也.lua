--在心仪之人前方时，自己减免伤害20%
local buff = buff_define("虎啸鹤舞_司徒来也")

local ReceiveDamageFactor = 0.2

function buff:BeforeReceiveDamage(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local dmgInfo = args.DamageInfo
    if is_role_of_beanId(alive_role_of_back(OwnerId), "西门香") then
      dmgInfo.DamageRatio = dmgInfo.DamageRatio - ReceiveDamageFactor
    end
end

function buff:OnOtherDeath(args)
  local OwnerId = self:GetBuffOwnerId(args)
  if not is_role_in_team("西门香", team_of_role(OwnerId)) then
    remove_buff("虎啸鹤舞_司徒来也", OwnerId, OwnerId)
  end
end

return buff