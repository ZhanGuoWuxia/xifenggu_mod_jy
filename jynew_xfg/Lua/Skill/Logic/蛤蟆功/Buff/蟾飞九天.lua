local buff = buff_define("蟾飞九天")
--[蛤蟆功]持续期间，只要受到伤害，立时便有猛烈无比的劲道对目标造成内伤
local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType

function buff:OnReceiveDamage(args)
    if not role_has_buff(self:GetBuffOwnerId(args), "蛤蟆功") then
        return
    end

    local dmgInfo = args.DamageInfo
    local targetRoleId = dmgInfo.AttackRoleId
    local ownerId = self:GetBuffOwnerId(args)

    --计算伤害值
    local damageToReflect = (role_stat(ownerId, stat_key.InnerStrength) * 0.7)

    self:TryDoBuffDamage(args, ownerId, targetRoleId, damageToReflect, DamageType.Magical)
end

return buff
