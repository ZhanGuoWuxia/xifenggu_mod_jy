--把伤害分担给同列的其他队友
local buff = buff_define("患难与共")
local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType

function buff:BeforeReceiveDamage(args)
  local ownerId = self:GetBuffOwnerId(args)
  local dmgInfo = args.DamageInfo
  local otherRoles = get_other_roles_in_same_col(ownerId)
  if #otherRoles > 0 then
  --计算总共有多少角色需要分担伤害（包括受伤害的角色本身）
  local totalRoles = #otherRoles + 1
  local sharedDamage = dmgInfo.TempValue / totalRoles

  --对每个角色应用分担的伤害
  for _, roleId in ipairs(otherRoles) do
    self:TryDoBuffDamage(args, ownerId, roleId, sharedDamage, DamageType.Physical)
  end

  --更新原始受伤害的角色的伤害量
  dmgInfo.TempValue = sharedDamage
  end
end

return buff