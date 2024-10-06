--与何猛和潘麻子共同上场时，提升10%减伤
local buff = buff_define("兄弟齐心_梁胜")

function buff:OnRoundStart(args)
    local ownerId = self:GetBuffOwnerId(args)
    local is_ok = is_role_in_team("何猛", team_of_role(ownerId)) and is_role_in_team("潘麻子", team_of_role(ownerId))
    if is_ok then
        args.buff:SetStat(stat_key.ReceiveDamageModifer, 0.1)  -- 减伤
    end
end

return buff