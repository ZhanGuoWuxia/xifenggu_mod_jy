local bleed = buff_define("流血")
--每回合结束时，每层会造成已损失生命值3%的伤害(上限10层), 最低伤害为每层0.5%最大生命值
--既 血量越低伤害越高
local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType
local minFactor = 0.005
local lose_hp_bleedFactor = 0.03

function bleed:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)
    local CasterId = self:GetBuffLastCasterId(args)
    local losed_hp_per = role_losed_hp_percent(ownerId)
    local addDamageRatio = 1 + role_stat(ownerId, stat_key.BleedDamage)
    local dmg = role_stat(ownerId, stat_key.MaxHp) * losed_hp_per* lose_hp_bleedFactor * self:GetBuffPile(args) * addDamageRatio
    local min_dmg = role_stat(ownerId, stat_key.MaxHp) * minFactor * self:GetBuffPile(args) * addDamageRatio
    dmg = math.max(min_dmg, dmg)
    self:TryDoBuffDamage(args, CasterId, ownerId, dmg, DamageType.Bleed)
end

return bleed
