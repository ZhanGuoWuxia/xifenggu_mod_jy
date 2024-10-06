local buff = buff_define("饰品_狂暴")

--在每回合结束后会给自己来上一拳，造成{{[stat:int]*0.4+[stat:atk]*0.4}}点外伤
local damageFactor = 0.4
function buff:OnRoundEnd(args)
    local OwnerId = self:GetBuffOwnerId(args)
    self:TryDoBuffDamage(args, -1, OwnerId, (role_stat(OwnerId, stat_key.InnerStrength)*damageFactor + role_stat(OwnerId, stat_key.Attack)*damageFactor))
end

return buff