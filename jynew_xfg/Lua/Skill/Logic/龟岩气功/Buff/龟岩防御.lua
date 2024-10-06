local buff = buff_define("龟岩防御")
--进入[龟岩防御]状态，此状态下受到攻击时会反弹伤害，对攻击者造成外伤
local DamageType = CS.ZhanGuoWuxia.Backend.Beans.DamageType

--受到攻击时会反弹伤害，对攻击者造成{{[stat:def] * 0.3}}点外伤
function buff:OnHit(args)
    local attakerId = args.AttackerId
    local ownerId = self:GetBuffOwnerId(args)

    --计算伤害值
    local damageToReflect = ( role_stat(ownerId, stat_key.Defense)* 0.3 )

    self:TryDoBuffDamage(args, ownerId, attakerId, damageToReflect, DamageType.Physical)
end

return buff
