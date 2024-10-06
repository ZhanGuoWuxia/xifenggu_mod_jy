local buff = buff_define("铁卫_磐石之躯")
--当受到5次伤害后，下次所受到的伤害减免80%
local reducefactor = 0.8

function buff:OnHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    add_buff("铁卫_磐石之躯计数", ownerId, ownerId)
end

function buff:OnParry(args)
    local ownerId = self:GetBuffOwnerId(args)
    add_buff("铁卫_磐石之躯计数", ownerId, ownerId)
end

function buff:BeforeReceiveDamage(args)
    local ownerId = self:GetBuffOwnerId(args)
    local dmgInfo = args.DamageInfo

    if role_buff_pile(ownerId,"铁卫_磐石之躯计数") == 6 then
        dmgInfo.DamageRatio = dmgInfo.DamageRatio - reducefactor
        remove_buff("铁卫_磐石之躯计数", ownerId, ownerId)
    end
end

return buff