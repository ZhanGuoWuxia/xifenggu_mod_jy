--与潘麻子和梁胜共同上场时，提升5%减伤和5%伤害加成
local buff = buff_define("兄弟齐心_何猛")

function buff:OnRoundStart(args)
    local ownerId = self:GetBuffOwnerId(args)
    local is_ok = is_role_in_team("潘麻子", team_of_role(ownerId)) and is_role_in_team("梁胜", team_of_role(ownerId))
    if is_ok then
        args.buff:SetStat(stat_key.ReceiveDamageModifer, 0.05)  -- 减伤
        args.buff:SetStat(stat_key.DoDamageModifier, 0.05)     -- 伤害加成
    end
end

return buff