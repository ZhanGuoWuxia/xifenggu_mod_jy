local buff = buff_define("铁甲护胸_铁甲")

local SubSkillType = CS.ZhanGuoWuxia.Backend.Beans.SubSkillType
local reducefactor = 0.5
--减少50%受到的射术伤害
function buff:BeforeReceiveDamage(args)
    local dmgInfo = args.DamageInfo
    local subSkillType = dmgInfo.SourceSubSkillType
    if subSkillType == SubSkillType.Shot then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio - reducefactor
    end
end

return buff