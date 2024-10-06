local buff = buff_define("欢喜冤家_司徒来也")

--给心仪之人加暴击，暴击时清除同量护盾值
function buff:OnAdd(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local TargetRoleId = str_to_battlerole_id_in_team("朱鹮儿", team_of_role(OwnerId))
    add_buff("暴击提升", TargetRoleId, OwnerId, 5, 2)
end

function buff:OnDoCrit(args)
    for _, targetId in pairs(args.Targets) do
        --获取角色护盾值
        local shield = role_stat(targetId, stat_key.Shield)
        role_add_shield(targetId , -shield)
    end
end

function buff:OnOtherDeath(args)
    local OwnerId = self:GetBuffOwnerId(args)
    if not is_role_in_team("朱鹮儿", team_of_role(OwnerId)) then
      remove_buff("欢喜冤家_司徒来也", OwnerId, OwnerId)
    end
end

return buff