--给心仪之人治疗时加成20%，被击败时时给心仪之人补全内力，增加速度
local buff = buff_define("彩蝶双飞")

local healHp_factor = 0.2

function buff:BeforeHealHp(args)
    local healedRoleId = args.RecoverResult.ReceiveRoleId
    if is_role_of_beanId(healedRoleId, "司徒来也") then
        args.RecoverResult.RecoverScale = args.RecoverResult.RecoverScale + healHp_factor
    end
end

function buff:OnDeath(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local TargetRoleId = str_to_battlerole_id_in_team("司徒来也", team_of_role(OwnerId))
    --补全内力
    local recoverMp = role_stat(TargetRoleId, stat_key.MaxMp)
    self:TryDoBuffMpChange(args, OwnerId, TargetRoleId, recoverMp)
    args.buff:SetStat(stat_key.SpeedPercent, 0.1)  -- 增速
end

return buff