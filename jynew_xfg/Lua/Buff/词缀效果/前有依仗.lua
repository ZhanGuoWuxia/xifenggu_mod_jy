local buff = buff_define("前有依仗")
--前方有队友时，伤害提升10%，没有队友时受到伤害提升10%

local GiveDamageFactor = 0.1
local ReceiveDamageFactor = 0.1


function buff:BeforeReceiveDamage(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local noFront = alive_role_of_front(OwnerId) == -1
    local dmgInfo = args.DamageInfo
    if noFront then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + ReceiveDamageFactor
    end
end

function buff:BeforeGiveDamage(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local hasFront = alive_role_of_front(OwnerId) ~= -1
    local dmgInfo = args.DamageInfo
    if hasFront then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio + GiveDamageFactor
    end
end

return buff