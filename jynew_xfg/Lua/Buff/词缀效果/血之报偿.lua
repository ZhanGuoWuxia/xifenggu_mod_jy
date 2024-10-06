local buff = buff_define("血之报偿")

local recoverFactor = 0.15

--效果:攻击处于<color=red>流血</color>状态的单位时，恢复自身已损失气血的<color=#00da2e>15%</color>。

function buff:OnDoHit(args)
    local OwnerId = self:GetBuffOwnerId(args)

    for _, targetId in pairs(args.Targets) do
        if role_has_buff(targetId, "流血") then
            local recoverHp = role_losed_hp_percent(OwnerId) * role_stat(OwnerId, stat_key.MaxHp) * recoverFactor
            self:TryDoBuffHeal( args, OwnerId, OwnerId, recoverHp)
        end
    end

end

return buff
