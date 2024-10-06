--气脉混乱无法集气，每回合损失3%气血值
local bleed = buff_define("走火入魔")
local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType
local lose_hp_bleedFactor = 0.03

function bleed:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)
    local CasterId = self:GetBuffLastCasterId(args)
    local dmg = role_stat(ownerId, stat_key.MaxHp) * lose_hp_bleedFactor * self:GetBuffPile(args)
    self:TryDoBuffDamage(args, CasterId, ownerId, dmg, DamageType.Magical)
end

return bleed