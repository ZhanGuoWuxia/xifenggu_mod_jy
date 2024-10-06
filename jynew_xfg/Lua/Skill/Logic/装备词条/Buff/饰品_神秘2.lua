local buff = buff_define("饰品_神秘2")

--每回合结束后，有55%的几率出现福佑·恢复{{[stat:int]*0.7+[stat:atk]*0.7}}点生命值
--反之出现天谴·损失{{[stat:int]*0.7+[stat:atk]*0.7}}点生命值

local Factor = 0.2
function buff:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)
    local value = role_stat(ownerId, stat_key.InnerStrength) * Factor + role_stat(ownerId, stat_key.Attack) * Factor

    if math.random(0,100) <=55 then
        self:TryDoBuffHeal(args, 1, ownerId, value)
    end

end

return buff