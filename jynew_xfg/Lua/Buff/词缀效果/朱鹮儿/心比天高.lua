local buff = buff_define("心比天高")

local addCrit = 60
local critMax = 300

--己方存活人数越少暴击越高
function buff:OnAdd(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local allies = get_team_alive_roles(team_of_role(OwnerId))
    local cnt = 6 - #allies
    args.buff:SetStat(stat_key.Crit, math.min((addCrit * cnt), critMax))
end

return buff
