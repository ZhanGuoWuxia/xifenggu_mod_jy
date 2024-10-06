local buff = buff_define("刺客_无情")
--对血量低于15%的单位发起攻击时，对其造成的伤害提升20%

local PlusDamageRatio = 0.2
local condition_hp_percent = 0.15

function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    local targetId = dmgInfo.TargetRoleId
    if role_hp_percent_check(targetId, "<", condition_hp_percent) then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + PlusDamageRatio
    end
end

return buff
