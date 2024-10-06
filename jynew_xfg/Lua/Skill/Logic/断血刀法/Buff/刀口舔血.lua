local buff = buff_define("刀口舔血")
--每击倒1名目标后，会令自身兴奋，提升5%暴击率，最多可叠加到30%。但受到的伤害也会加深10%，最多不超过60%

local addCrit = 50  --基础提升的暴击率
local critMax = 300    --暴击率最多可提升

local beHurt = -0.1  --基础受伤加深
local beHurtMax = -0.6    --受伤加深最高

function buff:OnKill(args)
    local ownerId = self:GetBuffOwnerId(args)
    local cnt = get_role_buff_int(ownerId, "刀口舔血", "刀口舔血计数")
    cnt = cnt + 1
    set_role_buff_int(ownerId, "刀口舔血", "刀口舔血计数", cnt)

    if args.buff then
        args.buff:SetStat(stat_key.Crit, math.min((addCrit * cnt), critMax))
        args.buff:SetStat(stat_key.ReceiveDamageModifer, math.max(beHurt * cnt,  beHurtMax))
    end
end

return buff