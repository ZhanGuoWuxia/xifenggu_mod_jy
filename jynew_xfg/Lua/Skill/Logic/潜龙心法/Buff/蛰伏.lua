local buff = buff_define("蛰伏")

local PlusDamageRatio = 0.2

function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    if dmgInfo:IsNormalAtk() then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + PlusDamageRatio
    end
end

--被攻击了会被移除
function buff:OnHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    remove_buff("蛰伏", ownerId, ownerId)
end

--完成普通攻击了也会移除
function buff:OnFinishSkillAttack(args)
    local ownerId = self:GetBuffOwnerId(args)
    if args.Skill.IsNormalAttack then
        remove_buff("蛰伏", ownerId, ownerId)
    end
end

return buff
