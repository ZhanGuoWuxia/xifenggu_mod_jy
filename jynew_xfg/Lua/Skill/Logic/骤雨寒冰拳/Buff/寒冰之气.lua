local buff = buff_define("寒冰之气")

local PlusDamageRatio = 0.2
local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType

--寒冰拳额外造成0.2内劲的伤害
function buff:OnDoHit(args)
    if not args.Skill:IsSkill("寒冰拳") then
        return
    end
    local attackerId = args.AttackerId
    local targets = args.Targets
    for _, defenderId in pairs(targets) do
        self:TryDoBuffDamage(args, attackerId, defenderId, role_stat(attackerId, stat_key.InnerStrength) * PlusDamageRatio, DamageType.Magical)
    end
end

return buff
