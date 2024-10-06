local buff = buff_define("阴阳生息")
--每回合开始时
--45%的几率运行[阴]以 内劲 恢复生命值，
--45%的几率运行[阳]以 攻击力 恢复生命值，
--10%的几率同时运行[阴阳] 恢复生命值

local statsFactor = 0.2

function buff:OnRoundStart(args)
    local ownerId = buff_arg_owner(args)
    local randomMath = math.random(0,100)

    if randomMath<=45 then
        self:TryDoBuffHeal(args, ownerId, ownerId, role_stat(ownerId, stat_key.InnerStrength) * statsFactor)
    elseif randomMath>45 and randomMath<90 then
        self:TryDoBuffHeal(args, ownerId, ownerId, role_stat(ownerId, stat_key.Attack) * statsFactor)
    else
        self:TryDoBuffHeal(args, ownerId, ownerId, role_stat(ownerId, stat_key.InnerStrength) * statsFactor + role_stat(ownerId, stat_key.Attack) * statsFactor)
    end
    
end

return buff