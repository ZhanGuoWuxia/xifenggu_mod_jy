local buff = buff_define("血饮斩")
--吸取造成的30%伤害的作为气血值恢复自身

local AbsorbHpMultipier = 0.3

function buff:OnGiveDamage(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local castSkillId = args.DamageInfo.SourceSkillId
    if castSkillId == "血饮斩" then
        local reHp = AbsorbHpMultipier * args.ActualDamage
        skill_absorb_hp("血饮斩", OwnerId, OwnerId, reHp)
    end
end

return buff