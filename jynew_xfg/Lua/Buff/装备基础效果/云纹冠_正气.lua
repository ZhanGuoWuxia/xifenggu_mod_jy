--令所有友方目标的集气提升1点
local buff = buff_define("云纹冠_正气")

function buff:OnAdd(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local allies = get_team_alive_roles(team_of_role(OwnerId))
    for i, roleId in pairs(allies) do
        if OwnerId ~= roleId then
            add_buff("云纹冠_集气", roleId, OwnerId)
        end
    end
end

function buff:OnDeath(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local allies = get_roles_of_team(team_of_role(OwnerId))
    for i, roleId in pairs(allies) do
        if OwnerId ~= roleId then
            remove_buff("云纹冠_集气", roleId, OwnerId)
        end
    end
end

return buff
