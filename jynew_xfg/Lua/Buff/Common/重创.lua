local buff = buff_define("重创")
--每层使恢复的生命下降10%
local buffFactor = 0.1

--当Buff携带者恢复生命前
function buff:BeforeRecoverHp(args)
    local recoverValue = args.RecoverResult.RecoverValue
    args.RecoverResult.RecoverValue = recoverValue - (recoverValue * buffFactor * self:GetBuffPile(args))
end


return buff