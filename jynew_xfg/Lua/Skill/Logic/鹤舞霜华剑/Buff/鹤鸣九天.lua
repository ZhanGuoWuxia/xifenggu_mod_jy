local buff = buff_define("鹤鸣九天")

local addFactor = 0.02
local addMax = 0.2
--每攻击1次，提升自身2%伤害
function buff:OnAttack(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local cnt = get_role_buff_int(OwnerId, "鹤鸣九天", "鹤鸣九天计数")
    cnt = cnt + 1
    set_role_buff_int(OwnerId, "鹤鸣九天", "鹤鸣九天计数", cnt)
    
    if args.buff then
        args.buff:SetStat(stat_key.DoDamageModifier, math.min( (addFactor * cnt),  (addMax)))
    end
end

return buff