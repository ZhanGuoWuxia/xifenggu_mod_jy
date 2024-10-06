local buff = buff_define("暂避锋芒")
local PlusDodge = 50

--受到伤害时，若自身拥有护盾，提升50点闪避(5%闪避率)
function buff:BeforeDefenderHit(args)
    local hit_param = args.HitParam
    local ownerId = self:GetBuffOwnerId(args)
    if role_shield_check(ownerId, ">", 0) then
        hit_param.DodgeAddition = hit_param.DodgeAddition + PlusDodge
    end
end

return buff