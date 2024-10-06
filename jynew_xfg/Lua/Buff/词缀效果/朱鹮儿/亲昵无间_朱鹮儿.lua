local buff = buff_define("亲昵无间_朱鹮儿")

--暴击时给心仪之人加暴击
function buff:OnDoCrit(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local TargetRoleId = str_to_battlerole_id_in_team("司徒来也", team_of_role(OwnerId))
    add_buff("暴击提升", TargetRoleId, OwnerId, 5, 2)
end

function buff:OnOtherDeath(args)
    local OwnerId = self:GetBuffOwnerId(args)
    if not is_role_in_team("司徒来也", team_of_role(OwnerId)) then
      remove_buff("亲昵无间_朱鹮儿", OwnerId, OwnerId)
    end
end

return buff