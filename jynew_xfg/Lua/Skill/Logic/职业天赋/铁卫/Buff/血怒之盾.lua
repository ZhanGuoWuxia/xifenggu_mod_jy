local buff = buff_define("铁卫_血怒之盾")
--当对目标造成伤害后，将造成的20%伤害值转化为护盾值

local ConvertFactor = 0.2
function buff:AfterSkillDamage(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local FinalShieldValue = args.Damage * ConvertFactor
    role_add_shield(OwnerId, FinalShieldValue)
end

return buff