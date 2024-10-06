local skill = skill_define("血煞斩空")

local SkillDamageScale = 2
local AbsorbHpMultipier = 0.1

function skill:GetSkillDamage(args)
    return role_stat(args.CasterId, stat_key.Attack) * SkillDamageScale
end

function skill:OnCast(args)
    self:TryDoSkillDamage(args)
    self:AbsorbHp(args)
end

function skill:AbsorbHp(args)
    local CasterId = args.CasterId
    local reHp = AbsorbHpMultipier * role_losed_hp_percent(CasterId) * role_stat(CasterId, stat_key.MaxHp)
    skill_absorb_hp("血煞斩空", CasterId, CasterId, reHp)
end

return skill
