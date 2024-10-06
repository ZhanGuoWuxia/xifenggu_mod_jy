local buff = buff_define("铁卫_以柔克刚")

local condition_hp_percent = 0.1
local reducefactor = 0.5

--当受到的伤害高于自身最大气血10%时，减免50%此处受到的伤害
function buff:BeforeReceiveDamage(args)
    local dmgInfo = args.DamageInfo
    local ownerId = self:GetBuffOwnerId(args)
    if dmgInfo.DamageRatio > (role_stat(ownerId, stat_key.MaxHp) * condition_hp_percent) then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio - reducefactor
    end
end

return buff