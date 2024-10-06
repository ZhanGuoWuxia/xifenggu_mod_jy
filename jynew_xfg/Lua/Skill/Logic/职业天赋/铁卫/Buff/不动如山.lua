local buff = buff_define("铁卫_不动如山")
--当回合开始时和结束后，若自身拥有护盾，则移除所有可驱散的减益状态

--当回合开始时
function buff:OnRoundStart(args)
    local ownerId = self:GetBuffOwnerId(args)
    --判断护盾值
    if role_stat(ownerId, stat_key.Shield) > 0 then
        --移除所有可驱散的减益状态
        dispel_debuffs(ownerId,ownerId)
    end
end

--当回合结束时
function buff:OnRoundEnd(args)
    local ownerId = self:GetBuffOwnerId(args)
    if role_stat(ownerId, stat_key.Shield) > 0 then
        dispel_debuffs(ownerId,ownerId)
    end
end

return buff