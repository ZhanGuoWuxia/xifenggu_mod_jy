local buff = buff_define("霸绝内劲")
--造成伤害时，额外附带{{[stat:int] * 0.5}}点内伤

local PlusDamageRatio = 0.5
local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType

function buff:OnDoHit(args)
    local attackerId = args.AttackerId
    local targets = args.Targets
    for _, defenderId in pairs(targets) do
        self:TryDoBuffDamage(args, attackerId, defenderId, role_stat(attackerId, stat_key.InnerStrength) * PlusDamageRatio, DamageType.Magical)
    end
end

return buff