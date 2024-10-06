local skill = skill_define("霸王横扫")
--以牺牲自己10%血为代价，对目标一列及其后一列的单位造成{{[stat:atk] * 1.5}}点外伤

--技能伤害
local SkillDamageScale = 1.5
--损失最大生命值百分比
local HpOfLost = 0.103
local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType

function skill:GetSkillDamage(args)
    return role_stat(args.CasterId, stat_key.Attack) * SkillDamageScale
end

function skill:OnCast(args)
    self:TryDoSkillDamage(args)
    self:DeductHp(args)
end

function skill:DeductHp(args)
    local CasterId = args.CasterId
    --获取角色最大生命值
    local GetRoleHp = math.ceil(role_stat(CasterId, stat_key.MaxHp) * HpOfLost)
    --根据最大生命值受到伤害
    deduct_hp(CasterId, GetRoleHp, DamageType.Physical)
end

return skill