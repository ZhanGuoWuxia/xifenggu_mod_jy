local buff = buff_define("蚀血刀影")
--吸取造成的15%伤害的作为气血值恢复自身

local AbsorbHpMultipier = 0.15

function buff:OnGiveDamage(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local castSkillId = args.DamageInfo.SourceSkillId
    if castSkillId == "血饮击" then
        local reHp = AbsorbHpMultipier * args.ActualDamage
        skill_absorb_hp("血饮击", OwnerId, OwnerId, reHp)
    end
end

return buff
