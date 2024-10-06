local buff = buff_define("好色之徒")
--对女性角色伤害降低20%

local femaleFactor = 0.2
local maleFactor = 0

function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    local targetId = dmgInfo.TargetRoleId

    -- 判断角色性别，然后根据性别调整伤害比例
    local genderFactor = is_role_male(targetId) and maleFactor or femaleFactor
    dmgInfo.DamageRatio = dmgInfo.DamageRatio - genderFactor
end

return buff
