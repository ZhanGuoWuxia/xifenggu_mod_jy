--回合开始时，若位于战场正中心时，所有伤害提升20%，此外己方场上人越少，攻击力越高
local buff = buff_define("孤傲冷峻")

local totalAttackPercent = 0.4
local reducedAttackPercent = 0.05
local DamageModiferFactor = 0.2

local function RefreshAttackPercent(args)
    local OwnerId = buff_arg_owner(args)

    -- 计算已损失生命值的百分比
    local allies = get_alive_teammates(OwnerId)

    -- 计算提升的攻击力百分比
    local atkPercent = math.max(0, totalAttackPercent - #allies * reducedAttackPercent)

    args.buff:SetStat(stat_key.AttackPercent, atkPercent)
end

function buff:OnRoundStart(args)
    local ownerId = self:GetBuffOwnerId(args)
    local pos = pos_of_role(ownerId)
    if pos == 4 then
        args.buff:SetStat(stat_key.DoDamageModifier, DamageModiferFactor)
    else
        args.buff:SetStat(stat_key.DoDamageModifier, 0)
    end
end

function buff:OnAdd(args)
    RefreshAttackPercent(args)
end

function buff:OnOtherDeath(args)
    RefreshAttackPercent(args)
end

return buff
