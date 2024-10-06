local buff = buff_define("虎啸穿云")
--提升[岳破天开]20%伤害
local plusDamageRatio = 0.2


function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    if dmgInfo.SourceSkillId == "岳破天开" then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + plusDamageRatio
    end

end


return buff