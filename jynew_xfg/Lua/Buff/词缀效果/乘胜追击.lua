local buff = buff_define("乘胜追击")

local recoverMp = 5

--每击败一个单位，则立即回复5点内力
function buff:OnKill(args)
    local OwnerId = self:GetBuffOwnerId(args)
    self:TryDoBuffMpChange( args, OwnerId, OwnerId, recoverMp)
end

return buff
