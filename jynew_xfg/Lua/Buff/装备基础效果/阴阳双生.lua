local buff = buff_define("阴阳双生")
--[[回合开始时,
若己方场上男性角色多于女性角色, 己方男性角色获得[阳生]
若己方场上女性角色多于男性角色, 己方女性角色获得[阴生]
若己方人数相同所有人获得[宁和]
]]--

function buff:OnRoundStart(args)
    local OwnerId = self:GetBuffOwnerId(args)

    local allies = get_team_alive_roles(team_of_role(OwnerId))

    if #allies == 0 then
        return
    end

    local men =  table.where(allies, is_role_male)
    local women = table.where(allies, is_role_female)
    local maleCount = #men
    local femaleCount = #women
    if maleCount == femaleCount then
        add_buff_to_roles("宁和", allies, OwnerId)
    elseif maleCount > femaleCount then
        add_buff_to_roles("阳生", men, OwnerId)
    else
        add_buff_to_roles("阴生", women, OwnerId)
    end
end

return buff