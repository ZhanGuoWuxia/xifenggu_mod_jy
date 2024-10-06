--对西门香的攻击伤害降低99%， 友方场上每多一个女性角色自身伤害提升5%
local buff = buff_define("龙湾情圣")

local reduceDamageRatio = 0.99
local DamageModiferFactor = 0.05

local function RefreshDamageModifier(args)
    local OwnerId = buff_arg_owner(args)

    -- 计算已损失生命值的百分比
    local allies = get_alive_teammates(OwnerId)

    local women = table.where(allies, is_role_female)

    args.buff:SetStat(stat_key.DoDamageModifier, #women * DamageModiferFactor)
end

function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    local defenderId = dmgInfo.DefenderId
    if is_role_person(defenderId, "西门香") then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio - reduceDamageRatio
    end
end

function buff:OnAdd(args)
    RefreshDamageModifier(args)
end

function buff:OnOtherDeath(args)
    RefreshDamageModifier(args)
end

return buff
