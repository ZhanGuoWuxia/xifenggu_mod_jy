local buff = buff_define("百折不挠")
local PlusParry = 100

--受到伤害时，若自身拥有护盾，提升100点格挡(10%格挡率)
function buff:BeforeDefenderHit(args)
    local hit_param = args.HitParam
    local ownerId = self:GetBuffOwnerId(args)
    if role_shield_check(ownerId, ">", 0) then
        hit_param.ParryAddition = hit_param.ParryAddition + PlusParry
    end
end

return buff