local buff = buff_define("领导者")
--在场时，根据队友职业提升其属性：T减伤；刺客暴击；侠士第一列招架，其余增伤；医师治疗；游侠命中

function buff:OnAdd(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local allies = get_team_alive_roles(team_of_role(OwnerId))
    for i, roleId in pairs(allies) do
        if OwnerId ~= roleId then
            add_buff("领导者_属性提升", roleId, OwnerId)
            if get_role_classId(roleId) == "铁卫" then
                set_role_buff_stat(roleId, "领导者_属性提升", "被伤害修正", 0.15)
            elseif get_role_classId(roleId) == "刺客" then
                set_role_buff_stat(roleId, "领导者_属性提升", "crt", 100)
            elseif get_role_classId(roleId) == "医师" then
                set_role_buff_stat(roleId, "领导者_属性提升", "治疗修正", 0.2)
            elseif get_role_classId(roleId) == "游侠" then
                set_role_buff_stat(roleId, "领导者_属性提升", "antidodge", 100)
            elseif get_role_classId(roleId) == "侠士" then
                if col_of_role(roleId) == 0 then
                    set_role_buff_stat(roleId, "领导者_属性提升", "parry", 100)
                else
                    set_role_buff_stat(roleId, "领导者_属性提升", "伤害修正", 0.15)
                end
            end
        end
    end
end

function buff:OnDeath(args)
    local OwnerId = self:GetBuffOwnerId(args)
    local allies = get_roles_of_team(team_of_role(OwnerId))
    for i, roleId in pairs(allies) do
        if OwnerId ~= roleId then
            remove_buff("领导者_属性提升", roleId, OwnerId)
        end
    end
end

return buff