local buff = buff_define("断血斩首")
--目标每丢失1%的气血值，断血斩首造成的伤害就提高1%

function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    
    if dmgInfo.SourceSkillId == "断血斩首" then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + role_losed_hp_percent(dmgInfo.TargetRoleId)
    end

end

return buff
