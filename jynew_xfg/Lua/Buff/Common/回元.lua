local buff = buff_define("回元")
--若气血低于70%，消耗1层[回元]，用来恢复{{[stat:int] * 1}}点气血值

local hpTrigger1 = 0.75
local hpTrigger2 = 0.5

function buff:OnHit(args)
    local ownerId = self:GetBuffOwnerId(args)
    local pile = self:GetBuffPile(args)
    if role_hp_percent(ownerId) < hpTrigger1 then
        --获取buff的施加者
        local argcaster = buff_arg_caster(args)
        local reHp = role_stat(argcaster, stat_key.InnerStrength) * 1
        do_buff_heal("回元", argcaster, ownerId, reHp)
        change_buff_pile(ownerId, "回元", -1)

        --若气血低于40%，再消耗1层
        if  get_role_buff_int(ownerId, "回元", "回天之力") > 0 and role_hp_percent(ownerId) < hpTrigger2 and pile >= 1 then
            do_buff_heal("回元", argcaster, ownerId, reHp)
            change_buff_pile(ownerId, "回元", -1)
        end
    end
end

return buff