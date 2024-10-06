local buff = buff_define("噬元")
--当自身气血值低于30%时，每次造成伤害后吸取气血值，目标每有1层中毒状态，则吸取0.5%已损失的气血值

function buff:AfterSkillDamage(args)
    local ownerId = self:GetBuffOwnerId(args)
    if role_has_buff(args.DefenderId, "中毒") then
        local reHp = role_losed_hp_percent(ownerId) * role_stat(ownerId, stat_key.MaxHp) * role_buff_pile(args.DefenderId, "中毒") * 0.005
        do_buff_heal("噬元", ownerId, ownerId, reHp)
    end
end

return buff