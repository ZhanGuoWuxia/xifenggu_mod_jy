local buff = buff_define("刺客_赶尽杀绝")
--对目标造成伤害后，若其生命值低于3%,则直接将其击败

local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType
local hp_percent_for_check = 0.03


function buff:AfterSkillDamage(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local targetId = args.DefenderId 
    if not is_dead(targetId) and role_hp_percent_check(targetId, "<", hp_percent_for_check) then
        self:TryDoBuffDamage(args, OwnerId, targetId, role_stat(targetId, stat_key.MaxHp)*2, DamageType.Physical)
    end
end

return buff
