--给心仪之人治疗时加成20%
local buff = buff_define("凤栖梧")

local healHp_factor = 0.2

function buff:BeforeHealHp(args)
    local healedRoleId = args.RecoverResult.ReceiveRoleId
    if is_role_of_beanId(healedRoleId, "司徒来也") then
        args.RecoverResult.RecoverScale = args.RecoverResult.RecoverScale + healHp_factor
    end
end

function buff:OnOtherDeath(args)
    local OwnerId = self:GetBuffOwnerId(args)
    if not is_role_in_team("司徒来也", team_of_role(OwnerId)) then
      remove_buff("凤栖梧", OwnerId, OwnerId)
    end
end

return buff