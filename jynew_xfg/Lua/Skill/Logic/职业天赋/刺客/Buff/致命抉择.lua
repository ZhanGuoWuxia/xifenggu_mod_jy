local buff = buff_define("刺客_致命抉择")

local condition_hp_percent = 0.5

--攻击生命值高于50%的目标时，造成5%-10%额外伤害，目标当前生命值百分比越高，造成的额外伤害越高
function buff:BeforeGiveDamage(args)
    local dmgInfo = args.DamageInfo
    local targetRoleId = dmgInfo.TargetRoleId
    local roleHpPercent = role_hp_percent(targetRoleId)
    if roleHpPercent > condition_hp_percent then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + roleHpPercent/10
        self:NotifyTriggered(args)
    end
end

return buff