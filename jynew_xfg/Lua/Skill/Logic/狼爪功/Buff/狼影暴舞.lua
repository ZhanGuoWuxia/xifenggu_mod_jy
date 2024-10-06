local buff = buff_define("狼影暴舞")

local recoverMp = 2

--有{{[stat:crt] * 0.05}}%的几率在暴击时，恢复自身2点内力值
local function buff_chance(args)
    local prob = role_stat(buff_arg_owner(args), stat_key.Crit) * 0.05
    return chance(prob)
end

function buff:OnDoCrit(args)
    if not buff_chance(args) then
        return
    end
    local OwnerId = self:GetBuffOwnerId(args)
    --恢复自身 内力值
    self:TryDoBuffMpChange( args, OwnerId, OwnerId, recoverMp)
end



return buff