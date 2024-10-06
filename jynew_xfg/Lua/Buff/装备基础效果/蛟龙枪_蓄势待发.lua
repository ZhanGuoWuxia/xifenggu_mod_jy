local buff = buff_define("蛟龙枪_蓄势待发")
--招架成功后积累[气势]，[气势]达到3层后，下次攻击附带{{[stat:int] * 0.3}}的内伤。攻击完成后移除所有[气势]

local MaxMomentumCount = 3
local InnerStrengthDamageMulti = 0.3
local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType

function buff:OnParry(args)
    local OwnerId = self:GetBuffOwnerId(args)
    add_buff("蛟龙枪_气势", OwnerId, OwnerId)
end

--当Buff列携带者使用技能造成伤害后
---@param args.AttackerId int 攻击者Id
---@param args.DefenderId int 防御者Id
---@param args.Skill BattleSkillInstance 技能实例
---@param args.Damage int 实际伤害
function buff:AfterSkillDamage(args)
    local OwnerId = self:GetBuffOwnerId(args)
    if role_buff_pile(OwnerId, "蛟龙枪_气势") >= MaxMomentumCount then
        local dmgValue = InnerStrengthDamageMulti * role_stat(OwnerId, stat_key.InnerStrength)
        self:TryDoBuffDamage(args, OwnerId, args.DefenderId, dmgValue, DamageType.Magical)
    end
end

function buff:AfterSkillCast(args)
    local OwnerId = self:GetBuffOwnerId(args)
    if args.Skill.IsCastToEnemy and role_buff_pile(OwnerId, "蛟龙枪_气势") >= MaxMomentumCount then
        remove_buff("蛟龙枪_气势", OwnerId, OwnerId)
    end
end

return buff
