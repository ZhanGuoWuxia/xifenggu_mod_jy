--和心仪之人同时在场时，自己减免伤害10%，韧性提升10%，并为心仪之人挡下致命一击
local buff = buff_define("巫山云雨_鹿追")

function buff:OnAdd(args)
  local ownerId = self:GetBuffOwnerId(args)
  if is_role_in_team("司徒来也", team_of_role(ownerId)) then
      args.buff:SetStat(stat_key.ReceiveDamageModifer, 0.1)  -- 减伤
      args.buff:SetStat(stat_key.TenacityPercent, 0.1) --韧性
  end
end

function buff:OnAllyBeAttacked(args)
  local defenderId = args.DefenderId
  if is_role_of_beanId(defenderId, "司徒来也") then
    local OwnerId = self:GetBuffOwnerId(args)
    local dmgInfo = args.DamageInfo
    if role_hp_check(defenderId, "<=", dmgInfo.TempValue) then
      --挡刀
      do_block_skill(OwnerId, defenderId, dmgInfo, pos_of_role(defenderId), team_of_role(defenderId))
    end
  end
end

function buff:OnOtherDeath(args)
    local ownerId = self:GetBuffOwnerId(args)
    if not is_role_in_team("司徒来也", team_of_role(ownerId)) then
        remove_buff("巫山云雨_鹿追", ownerId, ownerId)
    end
end

return buff