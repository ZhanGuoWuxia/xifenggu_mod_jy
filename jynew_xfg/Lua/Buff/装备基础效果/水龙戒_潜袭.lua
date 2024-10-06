local buff = buff_define("水龙戒_潜袭")

local PlusDamageRatio = 0.2

function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    if dmgInfo:IsNormalAtk() then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + PlusDamageRatio
    end
end

--完成普通攻击了移除
function buff:OnFinishSkillAttack(args)
    local ownerId = self:GetBuffOwnerId(args)
    if args.Skill.IsNormalAttack then
        remove_buff("水龙戒_潜袭", ownerId, ownerId)
    end
end

return buff
