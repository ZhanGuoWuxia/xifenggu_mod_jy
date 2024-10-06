local buff = buff_define("坚韧不拔")
local condition_hp_percent = 0.4
local reducefactor = 0.1

--生命值低于40%时受到伤害降低10%
function buff:BeforeReceiveDamage(args)
    local dmgInfo = args.DamageInfo
    local ownerId = self:GetBuffOwnerId(args)
    if role_hp_percent_check(ownerId, "<", condition_hp_percent) then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio - reducefactor
    end
end

return buff
