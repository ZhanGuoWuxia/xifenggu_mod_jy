--与何猛和梁胜共同上场时，提升10%伤害加成
local buff = buff_define("兄弟齐心_潘麻子")

function buff:OnRoundStart(args)
    local ownerId = self:GetBuffOwnerId(args)
    local is_ok = is_role_in_team("何猛", team_of_role(ownerId)) and is_role_in_team("梁胜", team_of_role(ownerId))
    if is_ok then
        args.buff:SetStat(stat_key.DoDamageModifier, 0.1)     -- 伤害加成
    end
end

return buff