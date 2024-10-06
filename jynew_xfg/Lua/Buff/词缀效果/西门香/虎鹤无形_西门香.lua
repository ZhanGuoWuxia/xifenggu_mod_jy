--在心仪之人后方时，自己提升伤害20%，心仪之人攻击时，有概率追击同一目标
local buff = buff_define("虎鹤无形_西门香")

local GiveDamageFactor = 0.2

function buff:BeforeGiveDamage(args)
  local OwnerId = self:GetBuffOwnerId(args)
  local dmgInfo = args.DamageInfo
  if is_role_of_beanId(alive_role_of_front(OwnerId), "司徒来也") then
    dmgInfo.DamageRatio = dmgInfo.DamageRatio + GiveDamageFactor
  end
end

local function buff_chance(args)
  local prob = role_stat(buff_arg_owner(args), stat_key.Speed) * 0.2
  return chance(prob)
end

function buff:OnAttack(args)
  if not buff_chance(args) then
      return
  end
  local OwnerId = self:GetBuffOwnerId(args)
  do_persue_skill(str_to_battlerole_id_in_team("司徒来也", team_of_role(OwnerId)), "虎鹤无形", args.TargetParam.CastPosition , enemy_team_of_role(OwnerId))
end

function buff:OnOtherDeath(args)
  local OwnerId = self:GetBuffOwnerId(args)
  if not is_role_in_team("司徒来也", team_of_role(OwnerId)) then
    remove_buff("虎鹤无形_西门香", OwnerId, OwnerId)
  end
end

return buff