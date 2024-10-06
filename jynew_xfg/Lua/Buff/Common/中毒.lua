local poision = buff_define("中毒")
--每回合结束时，每层会额外损失2%最大生命值, 最高10层
local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType

local damageFactor = 0.02

function poision:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)
    local CasterId = self:GetBuffLastCasterId(args)
    local dmg = role_stat(ownerId, stat_key.MaxHp) * damageFactor * self:GetBuffPile(args) * (1 + role_stat(ownerId, stat_key.PoisonDamage))
    self:TryDoBuffDamage(args, CasterId, ownerId, dmg, DamageType.Poison)
end

return poision