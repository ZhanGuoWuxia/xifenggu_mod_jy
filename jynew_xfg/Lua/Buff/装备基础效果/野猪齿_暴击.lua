local buff = buff_define("野猪齿_暴击")
--每回合开始前，场上每有1个减益状态的单位，自身暴击率提高1%（最多叠加到30%）

local addCrit = 10  --基础提升的暴击率
local critMax = 300    --暴击率最多可提升

function buff:OnRoundStart(args)
    --获取队伍存活角色列表
    local allies = get_all_teams_alive_roles()

    local crit = args.buff:GetStat(stat_key.Crit)

    for i, roleId in pairs(allies) do
        if role_has_debuff(roleId) then
            crit = crit + addCrit
        end
    end
    if crit > 0 then
        args.buff:SetStat(stat_key.Crit, math.min(crit, critMax))
    end
end

return buff