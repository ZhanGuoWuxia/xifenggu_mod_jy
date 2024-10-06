local buff = buff_define("钢劲强袭")
--造成伤害时，额外附带{{[stat:def] * 0.15}}点外伤

local PlusDamageRatio = 0.15
local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType

function buff:OnDoHit(args)
    local attackerId = args.AttackerId
    local targets = args.Targets
    for _, defenderId in pairs(targets) do
        self:TryDoBuffDamage(args, attackerId, defenderId, role_stat(attackerId, stat_key.Defense) * PlusDamageRatio, DamageType.Physical)
    end
end

return buff